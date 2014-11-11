# Download Vim plugins.
if [[ "$(type -P vim)" ]]; then
  if [ ! -f $HOME/.vim/bundle/Vundle.vim/README.md ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  fi
    vim +PluginInstall +qall
fi
