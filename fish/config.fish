set -x SHELL /usr/local/bin/fish
set -x EDITOR vim

set -x PATH $PATH /usr/local/sbin

set -x PATH $HOME/bin $PATH

# Golang
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin:$PATH

set gorootbin "/usr/local/go/bin"

if not contains $gorootbin $PATH
    set -x PATH $PATH $gorootbin
end

# Rust
set -x PATH $HOME/.cargo/bin:$PATH
if type -q rustc
    set -x RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src

    if type -q racer
        set -x RACER_PATH (command -v racer)
    end
end

eval "$(/opt/homebrew/bin/brew shellenv)"

source (pack completion --shell fish)

set gcloud_path (brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
source $gcloud_path

starship init fish | source
