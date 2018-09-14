# Neovim configuration

Configuration file for **Neovim** program. It includes basic editor configuration, list of plugins which is supported by plugin manager and some overrided shortcuts.

# Table of contents

* [Prerequirements](#prerequirements)
* [Installation](#installation)
* [Additional configuration](#additional-configuration)
* [Description](#description)
	* [Plugins manager](#plugins-manager)
	* [Plugins](#plugins)
	* [Shortcuts](#shortcuts)

# Prerequirements

* Neovim v0.3.1
	* Debian 9 - `apt install neovim`
* pylint ([More info](https://www.pylint.org/))
	* Debian 9
		* python 3 - `pip3 install pylint`
		* python 2 - `apt install pylint`
* rubocop ([More info](https://github.com/rubocop-hq/rubocop))
	* Debian 9 - `gem install rubocop`
* Silver Search ([More info](https://github.com/ggreer/the_silver_searcher))
	* Debian 9 - `apt install silversearcher-ag`

# Installation

Clone repository and copy `init.vim` to `~/.config/nvim/` directory. If you launch Neovim, plugins manager and plugins should install automatically.

If something is wrong, use `:PlugInstall` to install all plugins.

<h1 id="additional-configuration"> Additional configuration </h1>

* Debian 9
  * Add following lines to `~/.bash_profile`:
  ```
  export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  ```




# Description

<h2 id="plugins-manager">Plugins manager</h2>

To manage plugins, this configuration uses [vim-plug](https://github.com/junegunn/vim-plug).

## Plugins

List of plugins with repository links and short descriptions:

| Plugin name          | Description                                                                                                                                                                                                                                                                 | Repository                                                                                                                                        |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| lightline.vim        | _Status line_<br/> Configuration supports git repository.                                                                                                                                                                                                                   | [itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)                                                                                 |
| fzf                  | _Fuzzy finder_<br/> Configuration supports git repository.<br />  Allows search words and files in whole project.<br/> It also install fzf as default search in bash history.<br /> Requires [ggreer/the_silver_searcher](https://github.com/ggreer/the_silver_searcher).   |  [junegunn/fzf](https://github.com/junegunn/fzf)<br/> [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim)                                      |
| vim-fugitive         | _Git wrapper_<br/> Provides wrappers for git commands.                                                                                                                                                                                                                      | [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)                                                                                       |
| nerdtree             | _Files tree viewer_<br /> Additional plugin provides support for git repository.                                                                                                                                                                                            |  [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)<br/> [Xuyuanp/nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin) |
| vim-gitgutter        | _Git status marker_<br/> It also allows manage chunks in git repository.                                                                                                                                                                                                    | [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter)                                                                               |
| vim-monokai          | _Theme_                                                                                                                                                                                                                                                                     | [crusoexia/vim-monokai](https://github.com/crusoexia/vim-monokai)                                                                                 |
| vim-surround         | _Fast changing surrounded symbol_                                                                                                                                                                                                                                           | [tpope/vim-surround](https://github.com/tpope/vim-surround)                                                                                       |
| indentLine           | _Mark indentation_                                                                                                                                                                                                                                                          | [Yggdroot/indentLine](https://github.com/Yggdroot/indentLine)                                                                                     |
| far.vim              | _Search and replace_                                                                                                                                                                                                                                                        | [brooth/far.vim](https://github.com/brooth/far.vim)                                                                                               |
| vim-ruby             | _Ruby syntax supporter_                                                                                                                                                                                                                                                     | [vim-ruby/vim-ruby](https://github.com/vim-ruby/vim-ruby)                                                                                         |
| syntastic            | _Linters manager_                                                                                                                                                                                                                                                           | [scrooloose/syntastic](https://github.com/scrooloose/syntastic)                                                                                   |
| deoplete             | _Autocomplete engine_                                                                                                                                                                                                                                                       | [Shougo/deoplete.nvim](https://github.com/Shougo/deoplete.nvim)                                                                                   |
| vim-multiple-cursors | _Multi cursors support_                                                                                                                                                                                                                                                     | [terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)                                                                   |
| markdown-preview.vim | _Markdown viewer_                                                                                                                                                                                                                                                           | [iamcco/markdown-preview.vim](https://github.com/iamcco/markdown-preview.vim)                                                                     |

## Shortcuts

List of shortcuts with their meaning. This list does not include shortcuts provided by plugins:

| Shortcut | Command             | Description                                      |
|----------|---------------------|--------------------------------------------------|
| C-P      | :ProjectFiles<CR>   | Search files in project                          |
| C-E      | :Buffers<CR>        | Search words in opened buffers                   |
| C-F      | :BLines<CR>         | Search words in lines in current buffer          |
| A-\      | :GFiles?<CR>        | Search files in modified files in git repository |
| C-S      | :Ag<CR>             | Search words in whole project                    |
| C-\      | :NERDTreeToggle<CR> | Toggle NERDTree                                  |
| F5       | :Gdiff<CR>          | Show changes in current buffer                   |
| C-c      | ESC                 | Override default behaviour for C-c               |
| C-n      |                     | Start multicursor/next cursor                    |
| C-c      |                     | Quit from multicursor                            |
