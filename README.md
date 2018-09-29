<h1 align="center">dot-files</h1>

<div align="center">
  <img src="/imgs/logo.png" />
</div>

<br>

<div align="center">
  <p>My whole system configuration on one script away :tophat:</p>

  <p>Based on TMUX + VIM :heart:</p>
</div>

### Requirements

- System package manager up to date
- [build-essential](https://packages.ubuntu.com/trusty/build-essential) (Ubuntu)
- Know [VIM](https://www.vim.org/) and [TMUX](https://github.com/tmux/tmux/wiki) <img height="18px" width="18px" src="/imgs/pacman.png" />

### Relevant config files

Makefile &nbsp; &nbsp; &nbsp; &nbsp; -> [Makefile](/Makefile)

SCRIPTS &nbsp; &nbsp; &nbsp; &nbsp; -> [dots/.scripts](/dots/.scripts)

CONSTANT &nbsp; &nbsp; -> [config/constants.sh](/config/constants.sh)

TMUX Plugins -> [dots/.tmux.conf](/dots/.tmux.conf)

NVIM Plugins -> [dots/.config/nvim@](https://gitlab.com/cabaalexander/nvim/blob/master/settings/pluginmanager.vim)

### Usage

```bash
make && make install
```

