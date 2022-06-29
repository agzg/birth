#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y && sudo apt autoclean -y

# Begin with a big, fanciful welcome.
sudo apt install cowsay -y
cowsay "Wilkommen, Agzg!"

# Configure ~/.profile.
wget -qO $HOME/.profile https://raw.githubusercontent.com/agzg/birth/d5fe53ee43782db1eadd621bd607a4f023c94ee7/.profile?token=GHSAT0AAAAAABV4OMKCXIFYWRALW2Y6RRBUYV234IQ
source $HOME/.profile

# Install Google Chrome.
echo "Installing Google Chrome..."
wget -qO $HOME/Downloads/google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install $HOME/Downloads/google-chrome.deb -y
echo "Removing Firefox..."
sudo apt remove firefox* -y

# Install Python 3.10.
echo "Installing and configuring Python 3.10..."
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install python3.10-full python3.10-dev python3-pip python3-tk -y
pip install pandas, numpy, pyqt5, pillow, ghicon

# Install curl.
echo "Installing curl..."
sudo apt install curl -y

# Install Golang.
version=$(curl -s https://go.dev/VERSION?m=text)
echo "Installing Go ${version:2}..."
wget -qO $HOME/Downloads/go.tar.gz https://go.dev/dl/$version.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf $HOME/Downloads/go.tar.gz

echo "Installing Ivy by Rob Pike..."
go install robpike.io/ivy@latest

# Install git.
echo "Installing and configuring git..."
sudo apt install git -y
git config --global user.name agzg
git config --global user.email azam.vw@gmail.com

# Install Spotify.
echo "Installing Spotify..."
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install spotify-client -y

# Install Sublime Text 4.
echo "Installing Sublime Text 4..."
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt install apt-transport-https -y
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install sublime-text -y

# Install Obsidian.
version=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/obsidianmd/obsidian-releases/releases/latest)
version=(${version//// })
version=${version[-1]:1}
echo "Installing Obsidian v$version..."
wget -qO $HOME/Downloads/obsidian.AppImage https://github.com/obsidianmd/obsidian-releases/releases/download/v$version/Obsidian-$version.AppImage
chmod +x $HOME/Downloads/obsidian.AppImage
$HOME/Downloads/obsidian.AppImage --appimage-extract
sudo mkdir $HOME/.icons
sudo cp squashfs-root/usr/share/icons/hicolor/512x512/apps/obsidian.png $HOME/.icons
sudo mkdir -p $HOME/.local/bin
sudo mv squashfs-root $HOME/.local/bin/obsidian
echo "[Desktop Entry]
Name=Obsidian
Exec=/home/$USER/.local/bin/obsidian/obsidian
Terminal=false
Type=Application
Icon=/home/$USER/.icons/obsidian.png
StartupWMClass=obsidian
X-AppImage-Version=$version
Comment=Obsidian
MimeType=x-scheme-handler/obsidian;
Categories=Office;" > $HOME/.local/share/applications/obsidian.desktop

# Install Zoom client.
echo "Installing Zoom..."
wget -qO $HOME/Downloads/zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install $HOME/Downloads/zoom.deb -y

# Install BSD games.
echo "Installing BSD games..."
sudo snap install zork
sudo apt install bsdgames bsdgames-nonfree -y

# Install other apps and tools.
echo "Installing Tweaks and dconf-editor..."
sudo apt install dconf-editor gnome-tweaks -y

echo "Installing rlwrap..."
sudo apt install rlwrap -y

echo "Installing xsel..."
sudo apt install xsel -y

echo "Installing VLC Media Player..."
sudo apt install vlc -y

echo "Installing The Rust Compiler..."
sudo apt install rustc -y

echo "Installing Visual Studio Code..."
sudo snap install code --classic

echo "Installing Discord..."
sudo snap install discord --classic

# Set up the dock.
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
dconf write /org/gnome/shell/favorite-apps \
	"['google-chrome.desktop', 'org.gnome.Nautilus.desktop', 'obsidian.desktop', 'sublime_text.desktop', 'spotify.desktop', 'discord_discord.desktop', 'code.desktop']"

# Clean up and exit.
sudo apt autoremove -y
sudo apt autoclean
echo "All done!"
