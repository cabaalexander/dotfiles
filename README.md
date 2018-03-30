<h1 align="center">dot-files</h1>

<div align="center">
  <img src="/img/logo.png" />
</div>

<br>

<div align="center">
  <p>My whole system configuration on one script away :tophat:</p>

  </p>Based on TMUX + VIM :heart:</p>
</div>

### Requirements

Know VIM and TMUX <img height="18px" width="18px" src="/img/pacman.png" />

#### Supported OS
* Linux
* Mac (Partially)

#### Apps

**Common**
- tree
- git
- tmux
- [neovim](https://neovim.io/)

**Linux**
- build-essentials
- python3
- python3-pip
- software-properties-common

#### Config files

TMUX Plugins
[Read at the .tmux.conf](/sync/dot-files/tmux.conf)

NVIM Plugins
[Read at the pluginmanager.vim](/sync/nvim/plugins/pluginmanager.vim)

### File Structure

    .
    ├── bin                               # Scripts available always in the terminal
    ├── dot-files
    ├── nvim                              # NeoVim
    │   ├── autoload
    │   ├── plugins                       # All the settings for neovim are here
    │   └── snippets
    └── unsync-files                      # Files in here will not be tracked via symlink

Note: All the files are spread in the system via [symlink(3)](https://linux.die.net/man/3/symlink) to keep them in sync within the repo

### Usage

```bash
$ ./install-it.sh
```

