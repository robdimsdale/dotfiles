set -x SHELL /usr/local/bin/fish
set -x EDITOR vim

fish_add_path /usr/local/sbin
fish_add_path $HOME/bin
fish_add_path $HOME/.cargo/bin

if type -q pack
  source (pack completion --shell fish)
end

set gcloud_path (brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
if test -f $gcloud_path
  source $gcloud_path
end

starship init fish | source
