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
if hash rustc 2>/dev/null;
    set -x RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src

    if hash racer 2>/dev/null;
        set -x RACER_PATH (command -v racer)
    end
end

starship init fish | source
