# What is used?
- [i3-gaps](https://github.com/Airblader/i3) — A fork of [tiling window manager](https://github.com/i3/i3) for `X11` [⚙️](./config/i3/config)
- [i3blocks](https://github.com/vivien/i3blocks) — A feed generator for text based status bars [⚙️](./config/i3blocks/config)
<!-- - [tint2](https://gitlab.com/o9000/tint2) — A lightweight panel/taskbar for Linux and BSD [⚙️](./config/tint2/tint2rc) -->
- [Polybar](https://github.com/polybar/polybar) — A fast and easy-to-use status bar [⚙️](./config/polybar)
- [Picom](https://github.com/yshui/picom) — A lightweight compositor for `X11` [⚙️](./config/picom.conf)
- [Rofi](https://github.com/davatorium/rofi) — A window switcher, application launcher and [dmenu](https://tools.suckless.org/dmenu/) replacement [⚙️](./config/rofi/config.rasi)
- [Dunst](https://dunst-project.org/) — A lightweight replacement for the notification daemons [⚙️](./config/dunst/dunstrc)
- [Redshift](https://github.com/jonls/redshift) — A tool that is used to adjust the color temperature of the screen [⚙️](./config/redshift.conf)
- Icon themes:
  - [Dracula](https://github.com/matheuuus/dracula-icons)
  - [Colloid](https://github.com/vinceliuice/Colloid-icon-theme)
  - [Tela Circle](https://github.com/vinceliuice/Tela-circle-icon-theme)
- Wallpapers:
  - [Dracula](https://github.com/dracula/wallpaper) [PRO](https://draculatheme.com/pro)
  - [GNOME](https://gitlab.gnome.org/GNOME/gnome-backgrounds)
- Fonts:
  1. [JetBrains Mono](https://www.jetbrains.com/lp/mono/)
  2. [Awesome](https://fontawesome.com/) (*icon glyphs*)
  3. [Droid Sans](https://fonts.adobe.com/fonts/droid-sans)
- Terminal Apps & Prompts:
  - [neofetch](https://github.com/dylanaraps/neofetch) — A command-line system information tool
  - [Starship](https://starship.rs/) — The minimal, blazing-fast, and infinitely customizable prompt for any shell [⚙️](./config/starship.toml)
  - [snixembed](https://git.sr.ht/~steef/snixembed) — proxy StatusNotifierItems as XEmbedded systemtray-spec icons
  - [xrandr](https://x.org/releases/current/doc/man/man1/xrandr.1.xhtml), [feh](https://feh.finalrewind.org/), [setxkbmap](https://linux.die.net/man/1/setxkbmap), [xcursorgen](https://linux.die.net/man/1/xcursorgen)
  - [Gawk](https://www.gnu.org/software/gawk/), [GNU coreutils](https://www.gnu.org/software/coreutils/), etc...

# Color schemes
<details><summary>Trivial</summary>

- [i3](https://github.com/dracula/i3)
- [i3lock-color](https://github.com/dracula/i3lock-color)
- [dmenu](https://github.com/dracula/dmenu)
- [Rofi](https://github.com/dracula/rofi)
- [Dunst](https://github.com/dracula/dunst)
- [GTK](https://github.com/dracula/gtk) (include [cursors](https://github.com/dracula/gtk/tree/master/kde/cursors))
- [Starship](https://github.com/dracula/starship)
- [Xresources](https://github.com/dracula/xresources)

</details>
<details><summary>Non-trivial</summary>

- [CopyQ](https://github.com/dracula/copyq) [⚙️](./config/copyq/themes/dracula.ini)
- [tint2](https://github.com/dracula/tint2) [⚙️](./config/tint2/tint2rc)

</details>

# Banners
<details><summary>Polybar</summary>
<p align="center">
  <img src="https://github.com/polybar/polybar/blob/master/doc/_static/banner.png#gh-light-mode-only" alt="Polybar">
  <img src="https://github.com/polybar/polybar/blob/master/doc/_static/banner-dark-mode.png#gh-dark-mode-only" alt="Polybar">
</p>

<p align="center">
A fast and easy-to-use tool for creating status bars.
</p>

<p align="center">
<a href="https://github.com/polybar/polybar/releases"><img src="https://img.shields.io/github/release/polybar/polybar.svg"></a>
<a href="https://github.com/polybar/polybar/releases"><img alt="GitHub All Releases" src="https://img.shields.io/github/downloads/polybar/polybar/total" /></a>
<a href="https://github.com/polybar/polybar/actions?query=workflow%3ACI"><img src="https://github.com/polybar/polybar/workflows/CI/badge.svg"></a>
<a href="https://github.com/polybar/polybar/actions?query=workflow%3A%22Release+Workflow%22"><img src="https://github.com/polybar/polybar/workflows/Release%20Workflow/badge.svg?branch=master"></a>
<a href="https://polybar.readthedocs.io"><img src="https://readthedocs.org/projects/polybar/badge/?version=latest"></a>
<a href="https://gitter.im/polybar/polybar"><img src="https://badges.gitter.im/polybar/polybar.svg"></a>
<a href="https://codecov.io/gh/polybar/polybar/branch/master"><img src="https://codecov.io/gh/polybar/polybar/branch/master/graph/badge.svg"></a>
<a href="https://github.com/polybar/polybar/blob/master/LICENSE"><img src="https://img.shields.io/github/license/polybar/polybar.svg"></a>
<a href="https://www.codetriage.com/polybar/polybar"><img src="https://www.codetriage.com/polybar/polybar/badges/users.svg"></a>
<a href="https://opencollective.com/polybar"><img src="https://opencollective.com/polybar/tiers/badge.svg"></a>
</p>
</details>

<details><summary>Starship</summary>
<p align="center">
  <img
    width="400"
    src="https://raw.githubusercontent.com/starship/starship/master/media/logo.png"
    alt="Starship – Cross-shell prompt"
  />
</p>

<p align="center">
  <a href="https://github.com/starship/starship/actions"
    ><img
      src="https://img.shields.io/github/actions/workflow/status/starship/starship/workflow.yml?branch=master&label=workflow&style=flat-square"
      alt="GitHub Actions workflow status"
  /></a>
  <a href="https://crates.io/crates/starship"
    ><img
      src="https://img.shields.io/crates/v/starship?style=flat-square"
      alt="Crates.io version"
  /></a>
  <a href="https://repology.org/project/starship/versions"
    ><img
      src="https://img.shields.io/repology/repositories/starship?label=in%20repositories&style=flat-square"
      alt="Packaging status"/></a
  ><br />
  <a href="https://discord.gg/starship"
    ><img
      src="https://img.shields.io/discord/567163873606500352?label=discord&logoColor=white&style=flat-square"
      alt="Chat on Discord"
  /></a>
  <a href="https://twitter.com/StarshipPrompt"
    ><img
      src="https://img.shields.io/badge/twitter-@StarshipPrompt-1DA1F3?style=flat-square"
      alt="Follow @StarshipPrompt on Twitter"
  /></a>
</p>
</details>

# @TODO
- [x] Make **@TODO** list;
+ [ ] Add battery module to:
  - [x] `i3blocks` (via `neofetch`);
  + [ ] `Polybar` ([wiki](https://github.com/polybar/polybar/wiki/Module:-battery)).
+ [ ] Analize possibility of usage `fprintd` in `i3lock`;
- [x] Replace `i3lock` with `i3lock-color`.

# Links
* [Author](https://github.com/zenorocha)
* [PRO](https://draculatheme.com/pro)

# Captures
<details><summary>Box</summary>
<div align="center"><img src="https://raw.githubusercontent.com/etokarew/i3dracula/main/captures/current.png" alt="Current"></div>
<br>
<div align="center"><img src="https://raw.githubusercontent.com/etokarew/i3dracula/main/captures/current-polybar.png" alt="Current (Polybar)"></div>
<br>
<div>
  <img src="https://raw.githubusercontent.com/etokarew/i3dracula/main/captures/hdmi.png" alt="HDMI" align="left" height="270px">
  <img src="https://raw.githubusercontent.com/etokarew/i3dracula/main/captures/dvi.png" alt="DVI" align="right" height="480px">
</div>
</summary>
