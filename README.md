# Neovim configuration

This is repository with configuration for **Neovim** program. It includes basic editor configuration, list of plugins which is supported by plugin manager and shortcuts.

# Table of contents

* [Prerequirements](#prerequirements)
* [Installation](#installation)
* [Additional configuration](#additional-configuration)
* [Description](#description)
	* [Plugins manager](#plugins-manager)
	* [Plugins](#plugins)
	* [Shortcuts](#shortcuts)

# Prerequirements

* Ruby >= 2.1.8
* Python 3
* Neovim v0.3.1
	* Debian 9 - `apt install -t=unstable neovim=0.3.1`
* vim-plug([More info](https://github.com/junegunn/vim-plug))
  * `curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
* pylint ([More info](https://www.pylint.org/))
  * python 3 - `pip3 install pylint`
* rubocop ([More info](https://github.com/rubocop-hq/rubocop))
	* `gem install rubocop`
* Silver Search ([More info](https://github.com/ggreer/the_silver_searcher))
	* Debian 9 - `apt install silversearcher-ag`
* Ruby client for neovim
  * `gem install neovim`
* Python client for neovim
  * `pip3 install neovim`
* Ctags ([More info](https://github.com/universal-ctags/ctags))
  * Debian 9 - `apt install ctags`
* Ripper tags([More info](https://github.com/tmm1/ripper-tags))
  * `gem install ripper-tags`

# Installation

Clone repository and copy `init.vim` to `~/.config/nvim/` directory.  Use `:PlugInstall` to install all plugins.

<h1 id="additional-configuration"> Additional configuration </h1>

* Debian 9
  * Add following lines to `~/.bash_profile` to configure ag:
  ```
  export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  ```

# Description

<h2 id="plugins-manager">Plugins manager</h2>

To manage plugins, this configuration uses [vim-plug](https://github.com/junegunn/vim-plug).

## Plugins

List of plugins with repository links and short descriptions:

| Plugin name          | Description                                                                                                                                                                                                                                                               | Repository                                                                                                                                       |
|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| lightline.vim        | _Status line_<br/> Configuration supports git repository.                                                                                                                                                                                                                 | [itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)                                                                                |
| fzf                  | _Fuzzy finder_<br/> Configuration supports git repository.<br />  Allows search words and files in whole project.<br/> It also install fzf as default search in bash history.<br /> Requires [ggreer/the_silver_searcher](https://github.com/ggreer/the_silver_searcher). | [junegunn/fzf](https://github.com/junegunn/fzf)<br/> [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim)                                     |
| vim-fugitive         | _Git wrapper_<br/> Provides wrappers for git commands.                                                                                                                                                                                                                    | [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)                                                                                      |
| nerdtree             | _Files tree viewer_<br /> Additional plugin provides support for git repository.                                                                                                                                                                                          | [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)<br/> [Xuyuanp/nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin) |
| vim-gitgutter        | _Git status marker_<br/> It also allows manage chunks in git repository.                                                                                                                                                                                                  | [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter)                                                                              |
| vim-monokai          | _Theme_                                                                                                                                                                                                                                                                   | [crusoexia/vim-monokai](https://github.com/crusoexia/vim-monokai)                                                                                |
| vim-surround         | _Fast changing surrounded symbol_                                                                                                                                                                                                                                         | [tpope/vim-surround](https://github.com/tpope/vim-surround)                                                                                      |
| indentLine           | _Mark indentation_                                                                                                                                                                                                                                                        | [Yggdroot/indentLine](https://github.com/Yggdroot/indentLine)                                                                                    |
| far.vim              | _Search and replace_                                                                                                                                                                                                                                                      | [brooth/far.vim](https://github.com/brooth/far.vim)                                                                                              |
| vim-ruby             | _Ruby syntax supporter_                                                                                                                                                                                                                                                   | [vim-ruby/vim-ruby](https://github.com/vim-ruby/vim-ruby)                                                                                        |
| syntastic            | _Linters manager_                                                                                                                                                                                                                                                         | [scrooloose/syntastic](https://github.com/scrooloose/syntastic)                                                                                  |
| deoplete             | _Autocomplete engine_ <br /> I don't use syntax autocomplete. I focus only on tags in buffers and project.                                                                                                                                                                | [Shougo/deoplete.nvim](https://github.com/Shougo/deoplete.nvim)                                                                                  |
| vim-multiple-cursors | _Multi cursors support_                                                                                                                                                                                                                                                   | [terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)                                                                  |
| markdown-preview.vim | _Markdown viewer_                                                                                                                                                                                                                                                         | [iamcco/markdown-preview.vim](https://github.com/iamcco/markdown-preview.vim)                                                                    |
| typescript-vim       | _Typescript syntax_                                                                                                                                                                                                                                                       | [leafgarland/typescript-vim](https://github.com/leafgarland/typescript-vim)                                                                      |
| undotree             | _Visualization of history of file_                                                                                                                                                                                                                                        | [mbbill/undotree](https://github.com/mbbill/undotree)                                                                                            |
| tagbar               | _Visualization of tags in file_                                                                                                                                                                                                                                           | [majutsushi/tagbar](https://github.com/majutsushi/tagbar)                                                                                        |
| easymotion           | _Quick jumps in file_                                                                                                                                                                                                                                                     | [easymotion/vim-easymotion](https://github.com/easymotion/vim-easymotion)                                                                        |
| goyo & vim-zenroom   | _Focus on file without any status bars, marks, etc._                                                                                                                                                                                                                      | [junegunn/goyo.vim](https://github.com/junegunn/goyo.vim)<br /> [amix/vim-zenroom2](https://github.com/amix/vim-zenroom2)                        |
| vim-expand-region    | _Expand selection region_                                                                                                                                                                                                                                                 | [terryma/vim-expand-region](https://github.com/terryma/vim-expand-region)                                                                        |
| vim-commentary       | _Comment and uncomment blocks and lines_                                                                                                                                                                                                                                  | [tpope/vim-commentary](https://github.com/tpope/vim-commentary)                                                                                  |
| vim-yankstack        | _Stack for yanks_                                                                                                                                                                                                                                                         | [maxbrunsfeld/vim-yankstack](https://github.com/maxbrunsfeld/vim-yankstack)                                                                      |
| vim-easygrep         | _Easy use of vimgrep_                                                                                                                                                                                                                                                     | [maxbrunsfeld/vim-yankstack](https://github.com/maxbrunsfeld/vim-yankstack)                                                                      |

## Shortcuts

Leader key is `,`

List of shortcuts with their meaning:

| Shortcut         | Command                                         | Description                                           |
|------------------|-------------------------------------------------|-------------------------------------------------------|
| C-P              | :ProjectFiles                                   | Search files in project                               | 
| C-E              | :Buffers                                        | Search words in opened buffers                        |
| C-F              | :Tags                                           | Search tag                                            |
| &lt;leader&gt;bl | :BLines                                         | Search words in lines in current buffer               |
| &lt;leader&gt;gf | :GFiles?                                        | Search modified files in git repository               |
| C-S              | :Ag                                             | Search words in whole project                         |
| C-\              | :NERDTreeToggle                                 | Toggle NERDTree                                       |
| C-c              | ESC                                             | Override default behaviour for C-c                    |
| C-n              |                                                 | Start multicursor/next cursor                         |
| C-c              |                                                 | Quit from multicursor                                 |
| &lt;leader&gt;gd | :Gdiff                                          | Open git diff in neovim for actual buffer             |
| &lt;leader&gt;gs | :Gstatus                                        | Show git status                                       |
| &lt;leader&gt;gb | :Gblame                                         | Show git blame                                        |
| &lt;leader&gt;gl | :Glog                                           | Show git log                                          |
| &lt;leader&gt;u  | :UndotreeToggle                                 | Open undotree                                         |
| &lt;leader&gt;tt | TagbarToggle                                    | Open tagbar                                           |
| &lt;leader&gt;z  | :Goyo                                           | Focus on actual file without any distracting elements |
| C-k              | &lt;Plug&gt;(expand\_region\_expand)            | Expand selection region                               |
| C-j              | &lt;Plug&gt;(expand\_region\_shrink)            | Shrink selection region                               |
| &lt;leader&gt;p  | &lt;Plug&gt;yankstack\_substitute\_older\_paste | Paste older yank                                      |
| &lt;leader&gt;P  | &lt;Plug&gt;yankstack\_substitute\_newer\_paste | Paste newer yank                                      |
| &lt;leader&gt;mp | :MarkdownPreview                                | Preview markdown file                                 |
| &lt;leader&gt;ms | :MarkdownPreviewStop                            | Stop markdown preview                                 |
| &lt;leader&gt;bd | :bd                                             | Close current buffer                                  |
| &lt;leader&gt;ba | :1,1000 bd!                                     | Close all buffers                                     |
| &lt;leader&gt;nh | :noh                                            | Simpler noh                                           |
