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

function generate_left_side_string() {
	local separator_end="#[bg=${black}]#{?client_prefix,#[fg=${magenta_bright}],#[fg=${blue}]}${right_arrow_full:?}#[none]"

	echo "#[fg=${black},nobold,nounderscore,noitalics]#{?client_prefix,#[bg=${magenta_bright}],#[bg=${blue}]} #S ${separator_end}"
}

function generate_inactive_window_string() {
	echo "#[bg=${black}] #{?client_prefix,#[fg=${magenta_bright}],#[fg=${blue_bright}]}#[bg=${black}] #I ${right_arrow:?} #W  #[none]"
}

function generate_active_window_string() {
	separator_start="#{?client_prefix,#[bg=${magenta_bright}],#[bg=${blue}]}#[fg=${black}]${right_arrow_full:?}#[none]"
	separator_end="#[bg=${black}]#{?client_prefix,#[fg=${magenta_bright}],#[fg=${blue}]}${right_arrow_full:?}#[none]"

	echo "${separator_start}#[fg=${black}] #I ${right_arrow:?}#{?client_prefix,#[bg=${magenta_bright}],#[bg=${blue}]}#[fg=${black}] #W #[none]${separator_end}#[none]"
}

function generate_right_side_string() {
	# separator_start="#[bg=${black},fg=${green_bright}]${left_arrow:?}#[none]"
	# separator_end="#[bg=${green_bright},fg=${black}]${left_arrow:?}#[none]"
	#
	# echo "${separator_start}#[bg=${green_bright},fg=${black},bold] %d-%m-%Y %H:%M ${separator_end}${separator_start}#[bg=${green_bright},fg=${black},bold] $(whoami) "
	echo ""
}
