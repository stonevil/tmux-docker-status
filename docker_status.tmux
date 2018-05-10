#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $CURRENT_DIR/scripts/helpers.sh

docker_icon="#($CURRENT_DIR/scripts/docker_icon.sh)"
docker_status="#($CURRENT_DIR/scripts/docker_status.sh)"
docker_icon_interpolation="\#{docker_icon}"
docker_status_interpolation="\#{docker_status}"

do_interpolation() {
	local string=$1
	local status_interpolated=${string/$docker_status_interpolation/$docker_status}
	local all_interpolated=${status_interpolated/$docker_icon_interpolation/$docker_icon}
	echo $all_interpolated
}

main() {
	update_tmux_option "status-right"
	update_tmux_option "status-left"
}
main
