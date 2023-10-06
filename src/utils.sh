#!/usr/bin/env bash

get_tmux_option() {
	local option=$1
	local default_value=$2
	local -r option_value=$(tmux show-option -gqv "$option")

	if [ -z "$option_value" ]; then
		echo "$default_value"
	else
		echo "$option_value"
	fi
}

# icons
right_arrow_full=""
left_arrow_full=""
right_arrow=""
left_arrow=""

# NOTE: this syntax is used to check for copy mode
# #{?#{!=:#{selection_present},},COPY-MODE,NORMAL-MODE}

function generate_left_side_string() {
	local separator_end="#[bg=${black}]#{?client_prefix,#[fg=${magenta_bright}],#{?#{!=:#{selection_present},},#[fg=${yellow}],#[fg=$blue]}}${right_arrow_full:?}#[none]"

	echo "#[fg=${black},nobold,nounderscore,noitalics]#{?client_prefix,#[bg=${magenta_bright}],#{?#{!=:#{selection_present},},#[bg=${yellow}],#[bg=${blue}]}} #S ${separator_end}"
}

function generate_inactive_window_string() {
	echo "#[bg=${black}] #{?client_prefix,#[fg=${magenta_bright}],#{?#{!=:#{selection_present},},#[fg=${yellow_bright}],#[fg=${blue_bright}]}}#[bg=${black}] #I ${right_arrow:?} #W  #[none]"
}

function generate_active_window_string() {
	separator_start="#{?client_prefix,#[bg=${magenta_bright}],#{?#{!=:#{selection_present},},#[bg=${yellow}],#[bg=${blue}]}}#[fg=${black}]${right_arrow_full:?}#[none]"
	separator_end="#[bg=${black}]#{?client_prefix,#[fg=${magenta_bright}],#{?#{!=:#{selection_present},},#[fg=${yellow}],#[fg=${blue}]}}${right_arrow_full:?}#[none]"

	echo "${separator_start}#[fg=${black}] #I ${right_arrow:?}#{?client_prefix,#[bg=${magenta_bright}],#{?#{!=:#{selection_present},},#[bg=${yellow}],#[bg=${blue}]}}#[fg=${black}] #W #[none]${separator_end}#[none]"
}

function generate_right_side_string() {
	separator_start="#[bg=${black}]#{?client_prefix,#[fg=${magenta_bright}],#{?#{!=:#{selection_present},},#[fg=${yellow}],#[fg=${green}]}}${left_arrow_full:?}#[none]"
	separator_end="#{?client_prefix,#[bg=${magenta_bright}],#{?#{!=:#{selection_present},},#[bg=${yellow}],#[bg=${green}]}}#[fg=${black}]${left_arrow_full:?}#[none]"

	echo "${separator_start}#{?client_prefix,#[bg=${magenta_bright}],#{?#{!=:#{selection_present},},#[bg=${yellow}],#[bg=${green}]}}#[fg=${black}] %d-%m-%Y ${left_arrow} %H:%M ${separator_end}${separator_start}#{?client_prefix,#[bg=${magenta_bright}],#{?#{!=:#{selection_present},},#[bg=${yellow}],#[bg=${green}]}}#[fg=${black}] $(whoami) "
}
