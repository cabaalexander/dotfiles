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

- [build-essential](https://packages.ubuntu.com/trusty/build-essential) (Linux)
- Know VIM and TMUX <img height="18px" width="18px" src="/img/pacman.png" />

### Relevant config files

CONSTANT -> [config/constants.sh](/config/constants.sh)

TMUX Plugins -> [dots/.tmux.conf](/dots/.tmux.conf)

NVIM Plugins -> [dots/.config/nvim/plugins/pluginmanager.vim](/dots/.config/nvim/plugins/pluginmanager.vim)

### Usage

Linux
```bash
sudo apt-get update && sudo apt-get install build-essential -y && make
```

Other OS
```bash
<update-devel-stuffs> && make
```

