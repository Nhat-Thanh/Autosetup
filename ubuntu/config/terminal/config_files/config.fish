# diable greeting message
set fish_greeting ""
 
set -g fish_prompt_pwd_dir_length -1
 
set NORMAL       '0m'
set BLACK 	     '30m'
set RED 	     '31m'
set GREEEN 	     '32m'
set BROWN 	     '33m'
set BLUE 	     '34m'
set PURPLE		 '35m'
set CYAN    	 '36m'
set LIGHT_GRAY   '37m'
set LIGHT_RED    '91m'
set LIGHT_GREEN  '92m'
set LIGHT_BLUE   '94m'
set WHITE        '97m'


set _USER_    	(printf "\e[1;$LIGHT_RED╭─%s" $USER    )
set _HOST_    	(printf "\e[1;$LIGHT_RED%s"   $hostname)
set USER_INPUT	(printf "\e[1;$LIGHT_RED╰─λ\e[$NORMAL" )
set AT        	(printf "\e[0;$WHITE@"				   )
set COLON 	 	(printf "\e[0;$WHITE:"				   )
set DOLAR 	 	(printf "\e[0;$WHITE\$"				   )
set IN 		 	(printf "\e[1;$WHITE%s" "in"		   )
 
function fish_prompt
	# get Current Workspace Directory
	if test "$PWD" = "/home/$USER"
		set _CWD_ '~'
	else
		set _CWD_ (basename $PWD)
	end
    set _CWD_ (printf "\e[0;$LIGHT_BLUE%s" $_CWD_)

	# get git brand
	set GIT_BRAND (git rev-parse --abbrev-ref HEAD 2>/dev/null)
	if test "$GIT_BRAND" != ""
    	set GIT_BRAND (printf "\e[1;$WHITE%b  \e[1;$LIGHT_GREEN%s" "\u2387" $GIT_BRAND)
	end

    printf '\n %s%s%s %s %s %s\n %s ' $_USER_ $AT $_HOST_ $IN $_CWD_ "$GIT_BRAND" $USER_INPUT
end

alias cls="clear && cppneofetch"
alias ls="ls -alh --color=always"
cppneofetch
