
set fish_greeting

source ~/.config/fish/aliases.fish

set -g colour_normal (set_color normal)
set -g colour_green (set_color green --bold)
set -g colour_cyan (set_color cyan --bold)
set -g colour_red (set_color red --bold)
set -g colour_yellow (set_color yellow --bold)
set -g colour_magenta (set_color magenta --bold)
set -g colour_black (set_color black --bold)

set fish_color_normal normal
set fish_color_command green --bold
set fish_color_quote 999900
set fish_color_redirection blue --bold
set fish_color_end green
set fish_color_error red --bold
set fish_color_param blue --bold
set fish_color_comment 990000
set fish_color_match cyan
set fish_color_search_match \x2d\x2dbackground\x3dpurple
set fish_color_operator cyan --bold
set fish_color_escape cyan --bold
set fish_color_cwd green
set fish_color_autosuggestion 555
set fish_color_user green
set fish_color_host normal

set fish_color_cwd_root red
set fish_color_history_current cyan
set fish_color_selection \x2d\x2dbackground\x3dpurple
set fish_color_status red
set fish_color_valid_path \x2d\x2dunderline
set fish_key_bindings fish_default_key_bindings
set fish_pager_color_completion normal
set fish_pager_color_description 555\x1eyellow
set fish_pager_color_prefix cyan
set fish_pager_color_progress cyan


set GOPATH ~/dev/go
set -x GOPATH $GOPATH
set PATH $HOME/.cargo/bin $HOME/bin $GOPATH/bin $PATH


cd ~
