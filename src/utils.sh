#!/usr/bin/env bash

# icons
right_arrow=""
left_arrow=""

function generate_left_side_string() {
	local separator_end="#[bg=${black}]#{?client_prefix,#[fg=${green_bright}],#[fg=${green}]}${right_arrow:?}#[none]"

	echo "#[fg=${black},bold]#{?client_prefix,#[bg=${green_bright}],#[bg=${green}]} #S ${separator_end}"
}

function generate_inactive_window_string() {
	local separator_start="#[bg=${magenta_bright},fg=${black}]${right_arrow:?}#[none]"
	local separator_internal="#[bg=${magenta},fg=${magenta_bright}]${right_arrow:?}#[none]"
	local separator_end="#[bg=${black},fg=${magenta}]${right_arrow:?}#[none]"

	echo "${separator_start}#[fg=${black},bold] #I ${separator_internal}#[fg=${black},bold] #W ${separator_end}"
}

function generate_active_window_string() {
	separator_start="#[bg=${red_bright},fg=${black}]${right_arrow:?}#[none]"
	separator_internal="#[bg=${red},fg=${red_bright}]${right_arrow:?}#[none]"
	separator_end="#[bg=${black},fg=${red}]${right_arrow:?}#[none]"

	echo "${separator_start}#[fg=${black},bold] #I ${separator_internal}#[fg=${black},bold] #W ${separator_end}#[none]"
}

function generate_right_side_string() {
	echo ""
}
