set -x SHELL /usr/local/bin/fish
set -x EDITOR vim

set -x PATH $PATH /usr/local/sbin

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

source (pack completion --shell fish)

starship init fish | source
