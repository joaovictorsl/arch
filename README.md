# Arch

This repository aims to streamline my arch setup.

## What it does?

Given a clean arch install, I am able to run some scripts and get everything
configured.

## What is my setup composed of?

| Dependency | Streamlined |
|------------|-------------|
| Yay        | 🟩          |
| Neovim     | 🟩          |
| Rust       | 🟩          |
| Golang     | 🟩          |
| ASDF       | 🟩          |
| Flutter    | 🟩          |
| Docker     | 🟩          |
| Git        | 🟩          |
| Ssh        | 🟩          |
| Oh My Zsh  | 🟩          |
| Ghostty    | 🟩          |
| Hyprland   | 🟩          |
| Chrome     | 🟩          |
| Lazygit    | 🟩          |
| Ngrok      | 🟩          |
| Others     | 🟩          |

## Getting started

I expect arch to be installed with network manager and archinstall.

1. Setup network

```
nmcli device wifi connect YOUR_NETWORK_SSID password YOUR_NETWORK_PASSWORD
```

2. Install git

```
sudo pacman -S --noconfirm git
```

3. Clone this repository

```
git clone https://github.com/joaovictorsl/arch
```

4. Run script

```
./arch/run.sh
```

5. Post scripts

- Setup android studio

## TODO

- Unbind Ctrl + Shift + N from ghostty
