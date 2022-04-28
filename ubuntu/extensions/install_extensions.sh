HOME_DIR=$1
EXTENSION_DIR="$HOME_DIR/.local/share/gnome-shell/extensions"
# EXTENSIONS=$(cat extensions/extensions.txt)

mkdir -p ${EXTENSION_DIR}
cp -rf extensions/ext/. $EXTENSION_DIR

# for extension in ${EXTENSIONS[*]}; do
#     # echo "extensions/"$extension"/"
#     rm -rf ${EXTENSION_DIR}/"${extension}"
#     cp -r extensions/"${extension}"/ $EXTENSION_DIR
# done


# @============================ Install from source ============================@

# *Dash-To-Dock
# make --directory github/dash-to-dock/ clean
# make --directory github/dash-to-dock/
# make --directory github/dash-to-dock/ install
# make --directory github/dash-to-dock/ clean
# @=============================================================================@
# @https://github.com/micheleg/dash-to-dock.git                                 @
# @File: schemas                                                                @
# @autohide: false                                                              @
# @intellihide: false                                                           @
# @autohide-in-fullscreen: false                                                @
# @dock-fixed: true                                                             @
# @apply-custom-theme: true                                                     @
# @show-trash: false                                                            @
# @show-mounts: false                                                           @
# @click-action: minimize-or-overview                                           @
# @scroll-action: cycle-windows                                                 @
# @=============================================================================@


# *CPU Power Manager
# make --directory github/cpupower/ clean
# make --directory github/cpupower/ build
# make --directory github/cpupower/ install PREFIX="${HOME_DIR}/.local"
# make --directory github/cpupower/ clean
# @=============================================================================@
# @https://github.com/martin31821/cpupower.git github/cpupower                  @
# @File: schemas                                                                @
# @profiles: thêm (10,50,true,"Default", "")                                    @
# @show-freq-in-taskbar: true                                                   @
# @=============================================================================@


# *system-monitor
# make --directory github/gnome-shell-system-monitor-applet clean
# make --directory github/gnome-shell-system-monitor-applet build
# make --directory github/gnome-shell-system-monitor-applet install
# make --directory github/gnome-shell-system-monitor-applet clean
# @=============================================================================@
# @https://github.com/paradoxxxzero/gnome-shell-system-monitor-applet.git       @
# @File: schemas                                                                @
# @dock-position: BOTTOM                                                        @
# @icon-display: false                                                          @
# @memory-refresh-time: 500                                                     @
# @memory-style: digit                                                          @
# @swap-refresh-time: 500                                                       @
# @swap-style: digit                                                            @
# @cpu-refresh-time: 500                                                        @
# @cpu-style: digit                                                             @
# @gpu-refresh-time: 500                                                        @
# @gpu-style: digit                                                             @
# @freq-refresh-time: 500                                                       @
# @freq-style: digit                                                            @
# @net-display: false                                                           @
# @net-refresh-time: 500                                                        @
# @net-style: digit                                                             @
# @disk-refresh-time: 500                                                       @
# @disk-style: digit                                                            @
# @thermal-display: true                                                        @
# @thermal-refresh-time: 500                                                    @
# @thermal-style: digit                                                         @
# @thermal-sensor-file: /sys/class/hwmon/hwmon4/temp1_input                     @
# @fan-refresh-time: 500                                                        @
# @fan-style: digit                                                             @
# @battery-refresh-time: 500                                                    @
# @=============================================================================@


# *clipboard-indicator
# make --directory github/gnome-shell-extension-clipboard-indicator install
# @=============================================================================@
# @https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git     @
# @File: schemas                                                                @
# @refresh-interval: 500                                                        @
# @history-size: 100                                                            @
# @preview-size: 50                                                             @
# @cache-size: 10240                                                            @
# @clear-history: ![CDATA[['<Super>c']]]                                        @
# @toggle-menu: ![CDATA[['<Super>v']]]                                          @
# @=============================================================================@



# *Net speed Simplified
# make --directory github/netspeedsimplified build
# make --directory github/netspeedsimplified install
# @=============================================================================@
# @https://github.com/prateekmedia/netspeedsimplified.git                       @
# @Files: schemas                                                               @
# @mode: 3                                                                      @
# @refreshtime: 1.0                                                             @
# @togglebool: false                                                            @
# @minwidth: 5.0                                                                @
# @=============================================================================@



# *Sound Input & Output Device Chooser
# make --directory github/gse-sound-output-device-chooser build
# make --directory github/gse-sound-output-device-chooser install
# @=============================================================================@
# @https://github.com/kgshank/gse-sound-output-device-chooser.git               @
# @Files: schema                                                                @
# @hide-menu-icons: true                                                        @
# @=============================================================================@
