# Yakub's dotfiles

My personal dotfiles.
Built on Debian Linux around GNU Stow.



## Prerequesites:
- git - fast, scalable, distributed revision control system (`$ sudo apt install git`)
- stow - Organizer for /usr/local software packages (`$sudo apt install stow`)

```console
$ sudo apt install git stow
```



## Dependencies: i3
- xorg - window system (`$ sudo apt install xorg`)
- i3wm - tiling window manager (`$ sudo apt install i3`)
- picom - compositor for X11 (`$ sudo apt install picom`)
- feh - wallpaper utility (`$ sudo apt install feh`)
- maim - screenshot utility (`$ sudo apt install maim`)
- xclip - access X selections (`$ sudo apt install xclip`)
- rofi - dmenu replacement (`$ sudo apt install rofi`)
- xcolpic - color picker for X (available on github: https://github.com/itsYakub/xcolpic.git)

```console
$ sudo apt install xorg i3wm picom feh maim xclip rofi -y
```



## Dependencies: sway
- sway - i3-compatible Wayland compositor (`$ sudo apt install sway`)
- wofi - dmenu replacement (`$ sudo apt install wofi`)
- slurp - cli utility to select a region in a Wayland compositor (`$ sudo apt install slurp`)
- grim - command-line utility to make screenshots of Wayland desktops (`$ sudo apt install grim`)
- swaylock - Screen locker for Wayland (`$ sudo apt install swaylock`)
- wl-clipboard - command line interface to the wayland clipboard (`$ sudo apt install wl-clipboard`)

```console
$ sudo apt install sway wofi slurp grim swaylock wl-clipboard
```



## Dependencies: vim
- git - fast, scalable, distributed revision control system (`$ sudo apt install git`)
- vim - a programmer's text editor (`$ sudo apt install vim`)
- vim-plug - plugin manager for vim (available on github: https://github.com/junegunn/vim-plug)

```console
$ sudo apt install git vim
```
