/*
 * Bamboo - A Vietnamese Input method editor
 * Copyright (C) 2018 Luong Thanh Lam <ltlam93@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

package main

import (
	"bufio"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"os/user"
	"path/filepath"
	"sort"
	"strings"
	"unicode"

	"github.com/BambooEngine/bamboo-core"
)

const (
	VnCaseAllSmall uint8 = iota + 1
	VnCaseAllCapital
	VnCaseNoChange
)
const (
	HomePage           = "https://github.com/BambooEngine/ibus-bamboo"
	CharsetConvertPage = "https://tools.jcisio.com/vietuni/"

	DataDir          = "/usr/share/ibus-bamboo"
	DictVietnameseCm = "data/vietnamese.cm.dict"
	DictEmojiOne     = "data/emojione.json"
)

const (
	configDir        = "%s/.config/ibus-%s"
	configFile       = "%s/ibus-%s.config.json"
	mactabFile       = "%s/ibus-%s.macro.text"
	sampleMactabFile = "data/macro.tpl.txt"
)

const (
	preeditIM = iota + 1
	surroundingTextIM
	backspaceForwardingIM
	shiftLeftForwardingIM
	forwardAsCommitIM
	xTestFakeKeyEventIM
	usIM
)

// Keyboard Shortcuts with keyVal-mask position
const (
	KSInputModeSwitch uint = iota * 2
	KSRestoreKeyStrokes
	KSViEnSwitch
	KSEmojiDialog
	KSHexadecimal
)

const (
	IBautoCommitWithVnNotMatch uint = 1 << iota
	IBmacroEnabled
	_IBautoCommitWithVnFullMatch //deprecated
	_IBautoCommitWithVnWordBreak //deprecated
	IBspellCheckEnabled
	IBautoNonVnRestore
	IBddFreeStyle
	IBnoUnderline
	IBspellCheckWithRules
	IBspellCheckWithDicts
	IBautoCommitWithDelay
	IBautoCommitWithMouseMovement
	_IBemojiDisabled //deprecated
	IBpreeditElimination
	_IBinputModeLookupTableEnabled //deprecated
	IBautoCapitalizeMacro
	_IBimQuickSwitchEnabled     //deprecated
	_IBrestoreKeyStrokesEnabled //deprecated
	IBmouseCapturing
	IBstdFlags = IBspellCheckEnabled | IBspellCheckWithRules | IBautoNonVnRestore | IBddFreeStyle |
		IBmouseCapturing | IBautoCapitalizeMacro | IBnoUnderline
)

var DefaultBrowserList = []string{
	"Navigator:Firefox",
	"google-chrome:Google-chrome",
	"chromium-browser:Chromium-browser",
}

var imLookupTable = map[int]string{
	preeditIM:             "C???u h??nh m???c ?????nh (Pre-edit)",
	surroundingTextIM:     "S???a l???i g???ch ch??n (Surrounding Text)",
	backspaceForwardingIM: "S???a l???i g???ch ch??n (ForwardKeyEvent I)",
	shiftLeftForwardingIM: "S???a l???i g???ch ch??n (ForwardKeyEvent II)",
	forwardAsCommitIM:     "S???a l???i g???ch ch??n (Forward as commit)",
	xTestFakeKeyEventIM:   "S???a l???i g???ch ch??n (XTestFakeKeyEvent)",
	usIM:                  "Th??m v??o danh s??ch lo???i tr???",
}

var imBackspaceList = []int{
	surroundingTextIM,
	backspaceForwardingIM,
	shiftLeftForwardingIM,
	forwardAsCommitIM,
	xTestFakeKeyEventIM,
}

type Config struct {
	InputMethod            string
	InputMethodDefinitions map[string]bamboo.InputMethodDefinition
	OutputCharset          string
	Flags                  uint
	IBflags                uint
	Shortcuts              [10]uint32
	DefaultInputMode       int
	InputModeMapping       map[string]int
}

func getConfigDir(ngName string) string {
	u, err := user.Current()
	if err == nil {
		return fmt.Sprintf(configDir, u.HomeDir, "bamboo")
	}
	return fmt.Sprintf(configDir, "~", "bamboo")
}

func setupConfigDir(ngName string) {
	if sta, err := os.Stat(getConfigDir(ngName)); err != nil || !sta.IsDir() {
		os.Mkdir(getConfigDir(ngName), 0777)
	}
}

func getConfigPath(engineName string) string {
	return fmt.Sprintf(configFile, getConfigDir(engineName), engineName)
}

func loadConfig(engineName string) *Config {
	var flags = IBstdFlags
	var defaultIM = preeditIM
	if engineName == "bamboous" {
		defaultIM = usIM
		flags = 0
	}
	var c = Config{
		InputMethod:            "Telex",
		OutputCharset:          "Unicode",
		InputMethodDefinitions: bamboo.GetInputMethodDefinitions(),
		Flags:                  bamboo.EstdFlags,
		IBflags:                flags,
		Shortcuts:              [10]uint32{1, 126, 0, 0, 0, 0, 0, 0, 5, 117},
		DefaultInputMode:       defaultIM,
		InputModeMapping:       map[string]int{},
	}

	setupConfigDir(engineName)
	data, err := ioutil.ReadFile(getConfigPath(engineName))
	if err == nil {
		json.Unmarshal(data, &c)
	}

	return &c
}

func saveConfig(c *Config, engineName string) {
	data, err := json.MarshalIndent(c, "", "  ")
	if err != nil {
		return
	}

	err = ioutil.WriteFile(fmt.Sprintf(configFile, getConfigDir(engineName), engineName), data, 0644)
	if err != nil {
		log.Println(err)
	}

}

func getEngineSubFile(fileName string) string {
	if _, err := os.Stat(fileName); err == nil {
		if absPath, err := filepath.Abs(fileName); err == nil {
			return absPath
		}
	}

	return filepath.Join(filepath.Dir(os.Args[0]), fileName)
}

func determineMacroCase(str string) uint8 {
	var chars = []rune(str)
	if unicode.IsLower(chars[0]) {
		return VnCaseAllSmall
	} else {
		for _, c := range chars[1:] {
			if unicode.IsLower(c) {
				return VnCaseNoChange
			}
		}
	}
	return VnCaseAllCapital
}

func inKeyList(list []rune, key rune) bool {
	for _, s := range list {
		if s == key {
			return true
		}
	}
	return false
}

func inStringList(list []string, str string) bool {
	for _, s := range list {
		if s == str {
			return true
		}
	}
	return false
}

func removeFromWhiteList(list []string, classes string) []string {
	var newList []string
	for _, cl := range list {
		if cl != classes {
			newList = append(newList, cl)
		}
	}
	return newList
}

func addToWhiteList(list []string, classes string) []string {
	for _, cl := range list {
		if cl == classes {
			return list
		}
	}
	return append(list, classes)
}

func getValueFromPropKey(str, key string) (string, bool) {
	var arr = strings.Split(str, "::")
	if len(arr) == 2 && arr[0] == key {
		return arr[1], true
	}
	return str, false
}

func isValidCharset(str string) bool {
	var charsets = bamboo.GetCharsetNames()
	for _, cs := range charsets {
		if cs == str {
			return true
		}
	}
	return false
}

type byString []string

func (s byString) Less(i, j int) bool {
	return s[i] < s[j]
}
func (s byString) Len() int {
	return len(s)
}
func (s byString) Swap(i, j int) {
	s[i], s[j] = s[j], s[i]
}

func sortStrings(list []string) []string {
	var strList = byString(list)
	sort.Sort(strList)
	return strList
}

func loadDictionary(dataFiles ...string) (map[string]bool, error) {
	var data = map[string]bool{}
	for _, dataFile := range dataFiles {
		f, err := os.Open(dataFile)
		if err != nil {
			return nil, err
		}
		rd := bufio.NewReader(f)
		for {
			line, _, err := rd.ReadLine()
			if err != nil {
				break
			}
			if len(line) == 0 {
				continue
			}
			var tmp = []byte(strings.ToLower(string(line)))
			data[string(tmp)] = true
			//bamboo.AddTrie(rootWordTrie, []rune(string(line)), false)
		}
		f.Close()
	}
	return data, nil
}

func isMovementKey(keyVal uint32) bool {
	var list = []uint32{IBusLeft, IBusRight, IBusUp, IBusDown, IBusPageDown, IBusPageUp, IBusEnd}
	for _, item := range list {
		if item == keyVal {
			return true
		}
	}
	return false
}

var vnSymMapping = map[rune]uint32{
	'???': 0x1001ea0,
	'???': 0x1001ea1,
	'???': 0x1001ea2,
	'???': 0x1001ea3,
	'???': 0x1001ea4,
	'???': 0x1001ea5,
	'???': 0x1001ea6,
	'???': 0x1001ea7,
	'???': 0x1001ea8,
	'???': 0x1001ea9,
	'???': 0x1001eaa,
	'???': 0x1001eab,
	'???': 0x1001eac,
	'???': 0x1001ead,
	'???': 0x1001eae,
	'???': 0x1001eaf,
	'???': 0x1001eb0,
	'???': 0x1001eb1,
	'???': 0x1001eb2,
	'???': 0x1001eb3,
	'???': 0x1001eb4,
	'???': 0x1001eb5,
	'???': 0x1001eb6,
	'???': 0x1001eb7,
	'???': 0x1001eb8,
	'???': 0x1001eb9,
	'???': 0x1001eba,
	'???': 0x1001ebb,
	'???': 0x1001ebc,
	'???': 0x1001ebd,
	'???': 0x1001ebe,
	'???': 0x1001ebf,
	'???': 0x1001ec0,
	'???': 0x1001ec1,
	'???': 0x1001ec2,
	'???': 0x1001ec3,
	'???': 0x1001ec4,
	'???': 0x1001ec5,
	'???': 0x1001ec6,
	'???': 0x1001ec7,
	'???': 0x1001ec8,
	'???': 0x1001ec9,
	'???': 0x1001eca,
	'???': 0x1001ecb,
	'???': 0x1001ecc,
	'???': 0x1001ecd,
	'???': 0x1001ece,
	'???': 0x1001ecf,
	'???': 0x1001ed0,
	'???': 0x1001ed1,
	'???': 0x1001ed2,
	'???': 0x1001ed3,
	'???': 0x1001ed4,
	'???': 0x1001ed5,
	'???': 0x1001ed6,
	'???': 0x1001ed7,
	'???': 0x1001ed8,
	'???': 0x1001ed9,
	'???': 0x1001eda,
	'???': 0x1001edb,
	'???': 0x1001edc,
	'???': 0x1001edd,
	'???': 0x1001ede,
	'???': 0x1001edf,
	'???': 0x1001ee0,
	'???': 0x1001ee1,
	'???': 0x1001ee2,
	'???': 0x1001ee3,
	'???': 0x1001ee4,
	'???': 0x1001ee5,
	'???': 0x1001ee6,
	'???': 0x1001ee7,
	'???': 0x1001ee8,
	'???': 0x1001ee9,
	'???': 0x1001eea,
	'???': 0x1001eeb,
	'???': 0x1001eec,
	'???': 0x1001eed,
	'???': 0x1001eee,
	'???': 0x1001eef,
	'???': 0x1001ef0,
	'???': 0x1001ef1,
	'???': 0x1001ef4,
	'???': 0x1001ef5,
	'???': 0x1001ef6,
	'???': 0x1001ef7,
	'???': 0x1001ef8,
	'???': 0x1001ef9,
	'??': 0x10001a0,
	'??': 0x10001a1,
	'??': 0x10001af,
	'??': 0x10001b0,
	'??': 0x01e3,
	'??': 0x01c3,
	'???': 0x1001ef2,
	'???': 0x1001ef3,
	'??': 0x01d0,
	'??': 0x01f0,
	'??': 0x03a5,
	'??': 0x03b5,
	'??': 0x03dd,
	'??': 0x03fd,
}
