# 2560 x 1440 display:
gsettings set org.gnome.desktop.interface scaling-factor 1
gsettings set org.gnome.desktop.interface text-scaling-factor 1

# lower resolution display:
#gsettings set org.gnome.desktop.interface scaling-factor 0
#gsettings set org.gnome.desktop.interface text-scaling-factor 0.5

# Sane settings for Gnome
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface toolbar-icons-size 'small'
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'
 
# Sane settings for Nautilus / FileChooser
gsettings set org.gnome.nautilus.list-view default-visible-columns "['name', 'size', 'type', 'date_modified', 'owner', 'group', 'permissions']"
gsettings set org.gnome.nautilus.list-view default-zoom-level 'small'
gsettings set org.gnome.nautilus.preferences show-hidden-files true
gsettings set org.gnome.nautilus.preferences sort-directories-first true
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gtk.Settings.FileChooser sort-directories-first true
 
# Sane settings for gedit
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true

# Sane settings for gnome-terminal
gsettings set org.gnome.Terminal.Legacy.Settings shell-integration-enabled true
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ visible-name 'Default'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ login-shell true
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ use-transparent-background true
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ background-transparency-percent 25

# power settings
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'
gsettings set org.gnome.desktop.session idle-delay 1800 # lock screen


# setup the rpmfusion 
$ sudo bash -c 'cat > /etc/yum.repos.d/onlyoffice.repo << 'EOF'
[onlyoffice]
name=onlyoffice repo
baseurl=http://download.onlyoffice.com/repo/centos/main/noarch/
gpgcheck=1
enabled=1
EOF'

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm gnome-tweak-tool terminator flameshot onlyoffice-desktopeditors unzip p7zip youtube-dl vlc 
# setup shell environments 
mkdir $HOME/Projects 

cd $HOME
git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv

pip install powerline-shell 

# install powerline fonts
cd $HOME/Projects
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh

cd $HOME/Projects/
git clone git@github.com:thieryl/workstation-setup.git
cd workstation-setup 
cp .bash* $HOME/
cd $HOME
source .bashrc 


# Setup Visual Studio Code 
vs_ci
code-insiders --install-extension Shan.code-settings-sync

