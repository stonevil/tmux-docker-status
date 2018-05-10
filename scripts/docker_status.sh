#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

docker_option_string="@docker_icon"

docker_icon_osx="⧈"
docker_icon="DOCKERS: "

docker_icon_default() {
	if is_osx; then
		echo "$docker_icon_osx"
	else
		echo "$docker_icon"
	fi
}

docker_count() {
	CONTAINERS="-1"
	if is_osx; then
		if command_exists "docker"; then
			if [[ $((`ps -ef | grep com.docker.hyperkit | grep -v grep | wc -l`)) > 0 ]]; then
				CONTAINERS=$((`docker ps -q | wc -l`))
			fi
		fi
	fi

	if is_linux; then
		if command_exists "docker"; then
			if [[ $((`ps -ef | grep dockerd | grep -v grep | wc -l`)) > 0 ]]; then
				CONTAINERS=$((`docker ps -q | wc -l`))
			fi
		fi
	fi

	echo "$CONTAINERS"
}

print_docker_status() {
	# spacer fixes weird emoji spacing
	local spacer=" "
	if [[ $(docker_count) -ge 0 ]]; then
		printf "$(get_tmux_option "$docker_option_string" "$(docker_icon_default)")$spacer$(docker_count)"
	fi
}

main() {
	print_docker_status
}
main
