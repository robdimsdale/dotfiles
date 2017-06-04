yubishell() {
  (
    eval $(keychain --agents "gpg" --quiet --eval);
    gpg-connect-agent updatestartuptty /bye;
    export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
    export PS1='\[\e[31m\][YUBI]\[\e[0m\] \$ ';
    bash --norc
  )
}
