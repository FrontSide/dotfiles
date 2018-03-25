#!/bin/bash

# Appends the given arguments as a line to vimrc
function vimrc_append {
	echo $@ >> ~/.vimrc
}

# Install vim if not installed
if [ ! -d $HOME/.vim ]
then
	apt install vim -y || yum install vim -y
fi

# Uninstall existing extensions 
mv ~/.vimrc ~/.vimrc.bkp.$(date +%Y%m%d%H%M)
rm -rf ~/.vim/bundle || true
rm -rf ~/.vim/autoload || true

# Install Pathogen (vim runtime path manager (here: for plug-ins))
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
vimrc_append execute "pathogen#infect()"

# Install nerdtree
rm -rf ~/.vim/bundle/nerdtree || true
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
vimrc_append ":nnoremap <C-g> :NERDTree<CR>"

# Install gruvbox colour scheme
git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox
vimrc_append colorscheme gruvbox
vimrc_append set background=dark

# Enable spellcheck (British English)
vimrc_append setlocal spell spelllang=en_gb

# Enable linenumbers
vimrc_append set number
