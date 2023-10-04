#!/usr/bin/env bash

# icons
right_arrow=""
left_arrow=""

function generate_left_side_string() {
	local separator_end="#[bg=${black}]#{?client_prefix,#[fg=${yellow_bright}],#[fg=${green_bright}]}${right_arrow:?}#[none]"

	echo "#[fg=${black},bold]#{?client_prefix,#[bg=${yellow_bright}],#[bg=${green_bright}]} #S ${separator_end}"
}

function generate_inactive_window_string() {
	local separator_start="#[bg=${white},fg=${black}]${right_arrow:?}#[none]"
	local separator_internal="#[bg=${gray},fg=${white}]${right_arrow:?}#[none]"
	local separator_end="#[bg=${black},fg=${gray}]${right_arrow:?}#[none]"

	echo "${separator_start}#[fg=${black},bold] #I ${separator_internal}#[fg=${black},bold] #W ${separator_end}"
}

function generate_active_window_string() {
	separator_start="#[bg=${blue_bright},fg=${black}]${right_arrow:?}#[none]"
	separator_internal="#[bg=${blue},fg=${blue_bright}]${right_arrow:?}#[none]"
	separator_end="#[bg=${black},fg=${blue}]${right_arrow:?}#[none]"

	echo "${separator_start}#[fg=${black},bold] #I ${separator_internal}#[fg=${black},bold] #W ${separator_end}#[none]"
}

function generate_right_side_string() {
	separator_start="#[bg=${black},fg=${green_bright}]${left_arrow:?}#[none]"
	separator_end="#[bg=${green_bright},fg=${black}]${left_arrow:?}#[none]"

	echo "${separator_start}#[bg=${green_bright},fg=${black},bold] %d-%m-%Y %H:%M ${separator_end}${separator_start}#[bg=${green_bright},fg=${black},bold] $(whoami) "
}
