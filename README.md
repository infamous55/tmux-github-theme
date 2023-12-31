<div align="center">
<br />
<img src="https://raw.githubusercontent.com/infamous55/tmux-github-theme/master/assets/github-octopus.png" width="80px">
<br />
<h1>
  GitHub Theme for <a href="https://github.com/tmux/tmux/wiki">Tmux</a>
</h1>
</div>

## Description

This is a port of the GitHub color schemes for the [tmux](https://github.com/tmux/tmux/wiki) terminal multiplexer.

## Showcase

https://github.com/infamous55/tmux-github-theme/assets/57194777/10ec28ce-a748-48ff-a0e7-95b957720010

The setup from the showcase video includes:

- **Terminal Emulator**: [Black Box](https://gitlab.gnome.org/raggesilver/blackbox), configured with the [GitHub Dark High Contrast theme](https://github.com/infamous55/blackbox-github-theme).
- **Text Editor**: [Neovim](https://neovim.io/) with the [GitHub Dark High Contrast](https://github.com/projekt0n/github-nvim-theme) theme and [Lualine](https://github.com/nvim-lualine/lualine.nvim) integration.
- **Terminal Multiplexer**: [Tmux](https://github.com/tmux/tmux/wiki), customized with the [GitHub Dark High Contrast color palette](https://github.com/infamous55/tmux-github-theme).

## Installation

To install this theme, simply list it as a plugin using the [tpm](https://github.com/tmux-plugins/tpm) package manager in your tmux configuration file.

```bash
set -g @plugin 'infamous55/tmux-github-theme'
```

Make sure to hit `prefix` + `I` to fetch the plugin and source it.

Additionally, you can specify a color variation as shown below:

```bash
set -g @color_variation "dark_colorblind"
```

For now, the supported palettes are:

- `dark` (default)
- `dark_dimmed`
- `dark_high_contrast`
- `dark_colorblind`
- `dark_tritanopia`

## Contributing

The theme is intentionally minimal, designed to align with my personal preferences. If you have any suggestions for improvements, specific plugin requests, or configuration options in mind, please don't hesitate to create an issue or submit a pull request.

## License

This repository is licensed under the MIT License. See the `LICENSE` file for details.
