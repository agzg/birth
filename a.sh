#!/bin/bash

sudo apt update
sudo apt upgrade -y

# Begin with a big, fanciful welcome.
sudo apt install cowsay -y
cowsay "Wilkommen, Agzg!"

# Configure ~/.profile.
wget -qO $HOME/.profile https://raw.githubusercontent.com/agzg/birth/d5fe53ee43782db1eadd621bd607a4f023c94ee7/.profile?token=GHSAT0AAAAAABV4OMKCXIFYWRALW2Y6RRBUYV234IQ
source $HOME/.profile

# Install Google Chrome.
echo "Installing Google Chrome"
wget -qO $HOME/Downloads/google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install $HOME/Downloads/google-chrome.deb -y
sudo apt remove firefox* -y
sudo snap remove firefox

# Install Steam.
wget -qO $HOME/Downloads/steam-latest.deb http://repo.steampowered.com/steam/archive/stable/steam_latest.deb
sudo apt install $HOME/Downloads/steam-latest.deb -y

# Install git.
echo "Installing and configuring git"
sudo apt install git -y
git config --global user.name agzg
git config --global user.email azam.vw@gmail.com

# Install Spotify.
echo "Installing Spotify"
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install spotify-client -y

echo "Installing compilers, editors, etc."
sudo apt install rustc -y
sudo snap install code --classic

# Install Python 3.11.
echo "Installing and configuring Python 3.11"
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install python3.11-full python3.11-dev python3-pip -y
pip install pandas numpy pyqt5 pillow ghicon

# Install curl.
echo "Installing curl"
sudo apt install curl -y

# Install Golang.
version=$(curl -s https://go.dev/VERSION?m=text)
echo "Installing Go ${version:2}"
wget -qO $HOME/Downloads/go.tar.gz https://go.dev/dl/$version.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf $HOME/Downloads/go.tar.gz
go install robpike.io/ivy@latest
go install golang.org/x/tools/cmd/goimports@latest

echo "Installing Sublime Text 4"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt install apt-transport-https -y
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install sublime-text -y

# Install Zoom client.
echo "Installing Zoom..."
wget -qO $HOME/Downloads/zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install $HOME/Downloads/zoom.deb -y

# Install BSD games.
echo "Installing BSD games..."
sudo snap install zork
sudo apt install bsdgames bsdgames-nonfree -y

# Install other apps and tools.
echo "Installing various tools and utilities"
sudo apt install dconf-editor gnome-tweaks -y
sudo apt install rlwrap -y
sudo apt install xsel -y

echo "Installing VLC Media Player..."
sudo apt install vlc -y

echo "Installing Discord..."
sudo snap install discord --classic

sudo apt autoremove -y
sudo apt autoclean
echo "TODO (most likely):
1. Set up GitHub PAT token.
2. Sign in to Chrome, Spotify, Discord, etc.
3. Set up Sublime Text 4.
4. Set up Steam, install games."
