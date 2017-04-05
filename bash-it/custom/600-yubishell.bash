yubishell() {
  (
    eval $(keychain --agents "gpg" --quiet --eval);
    gpg-connect-agent updatestartuptty /bye;
    export PS1='\[\e[31m\][YUBI]\[\e[0m\] \$ ';
    bash
  )
}
