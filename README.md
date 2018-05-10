# Tmux Docker status

Tmux plugin that show the number of the started Docker containers status.

Introduces a new `#{docker_status}` format.

This plugin is useful if:
- run a lot Docker containers and forget about this.

### Usage

Add `#{docker_icon}` and `#{docker_status}` format string to your existing `status-right` tmux option.

Here's the examples in `.tmux.conf`:

    set -g status-right "#{docker_status} | %a %h-%d %H:%M "

#### Configure icons
If the icons don't display well on your machine you can change them in
`.tmux.conf`:

    set -g @docker_icon "DOCKER CONTAINERS"

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @tpm_plugins "                 \
      tmux-plugins/tpm                    \
      stonevil/tmux-docker-status         \
    "

Hit `prefix + I` to fetch the plugin and source it.

`#{docker_status}` interpolation should now work.

### Manual Installation

Clone the repo:

    $ git clone https://github.com/stonevil/tmux-docker-status ~/clone/path

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/docker_status.tmux

Reload TMUX environment:

    # type this in terminal
    $ tmux source-file ~/.tmux.conf

`#{docker_status}` interpolation should now work.

### Limitations

Docker containers status icon most likely won't be instant. The duration depends on the `status-interval` Tmux option. So, it might take anywhere between 5 and 60 seconds for docker status icon to change.

Set `status-interval` to a low number to make this faster, example:

    # in .tmux.conf
    set -g status-interval 5

### Other plugins

You might also find these useful:

- [wan-status](https://github.com/stonevil/tmux-wan-status) - WAN status and IP
- [lan-status](https://github.com/stonevil/tmux-lan-status) - LAN status and IP
- [vm-status](https://github.com/stonevil/tmux-vm-status) - Virtual Machines status

### License

[MIT](LICENSE.md)
