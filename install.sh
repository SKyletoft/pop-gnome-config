cp home ~


curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.10/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
curl -fsSL https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.10/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_manuelschneid3r.gpg > /dev/null
sudo apt update
sudo apt install curl alacritty pinta ranger fonts-fantasque-sans code pcmanfm git valgrind vlc gnome-tweaks albert wmctrl
cargo install exa ripgrep exa fd-find bat bottom tokei

echo "Extensions installed are most likely out of date. Visit extensions.gnome.org to update them (This can't be done via cli)"
