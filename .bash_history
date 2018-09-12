sudo dnf upgrade -y 
sudooo  visudo 
id -a 
sudo visudo 
mkdir Project 
cd Project/
wget https://gist.githubusercontent.com/grenade/ba62d9a0369fe9a7bed5/raw/a9acac4bc994c00ed28c4539a7f64d27266f3170/fedora-27-setup.sh 
vim fedora-27-setup.sh 
vi fedora-27-setup.sh 
ls -lrt 
sh fedora-27-setup.sh 
sudo dnf install chrome-gnome-shell
sudo dnf install terminator 
hostname --help 
hostnamectl 
hostnamectl --help 
hostnamectl set-hostname trigoviste.loc
hostnamectl 
hostnamectl set-hostname tragoviste.loc
cd Project/
ls -lrt 
sudo dnf install gnome-tweaks
git clone https://github.com/fedy/fedy.git
cd fedy/
ls -lrt 
./fedy
sudo dnf install shutter 
sudo dnf install gnome-vfs2-common.noarch
# sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
cd ../
top
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
pip install powerline-shell 
pip install powerline-shell --user
git clone https://github.com/powerline/fonts.git
cd fonts/
ls -lrt 
vim install.sh 
vi install.sh 
./install.sh 
sudo fc-cache -vf
fc-cache -vf
dnf search vim 
sudo dnf install vim-enhance vim-powerline.noarch vim-syntastic-python-3.9.0-1.fc28.noarch vim-syntastic-php-3.9.0-1.fc28.noarch -y
sudo dnf install vim-enhanced vim-powerline.noarch vim-syntastic-python-3.9.0-1.fc28.noarch vim-syntastic-php-3.9.0-1.fc28.noarch -y
vim .bashrc 
reset 
 git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv
vim .bashrc 
vim .autoenv/activate.sh 
sudo dnf install sqlite3 
sudo dnf install sqlite
sudo dnf install sqlite-devel-3.22.0-4.fc28.x86_64 
shutter -s 
shutter 
S]X~as
@A
~}:
dnf search chrome 
sudo su - 
sudo dnf update 
sudo dnf install google-chrome-stable-68.0.3440.106-1.x86_64 
ssh-keygen -t rsa -b 4096 
cd .ssh/ 
ls -lrt 
scp -r thieryl@192.168.1.154:~/.ssh/* .
cd ../
scp -r thieryl@192.168.1.154:~/.dotfiles/.bash_functions .
vim .ssh/config
scp -r thieryl@192.168.1.154:~/.dotfiles/.bash_functions .
scp -r thieryl@192.168.1.154:~/.dotfiles/.bash_aliases .
vim .bashrc 
ls -lart 
vim .bashrc 
vs_ci 
mkdir tmp 
vs_ci 
prj 
ls -lrt 
cd workstation-setup/
ls -lrt 
cat fedora-setup.sh 
cd /tmp/; git clone https://github.com/tomasr/molokai.git
sudo dnf install vim vim-plugin-powerline
sudo cp molokai/colors/molokai.vim /usr/share/vim/vim81/colors/
mkdir ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git
git clone https://github.com/Valloric/YouCompleteMe.git
sudo dnf install automake gcc gcc-c++ kernel-devel cmake python-devel
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
/usr/bin/python ./install.py --clang-completer --go-completer --java-completer
vim +PluginInstall +qall
prj
cd workstation-setup/
vim fedora-setup.sh 
prj
mkdir flask 
cd flask/
git clone https://github.com/sunscrapers/flask-boilerplate.git
cd flask-boilerplate/
ls -lrt
python -m venv .venv
python3 -m venv .venv
ls -la 
source .venv/bin/activate
pip install -r requirements.txt 
pip install --upgrade pip 
pip install -r requirements.txt 
cd
cd -
cd ../../
ls -lrt 
cd PYTHON/
ls 
tar xjvf flask-web/
ls -lrt 
tar xzvf flask_recipe_app-v2.3.tar.gz 
cd flask
cd flask_recipe_app-v2.3/
ls -lrt 
cd project/
ls -lrt 
cd ../
pipenv 
pipenv install 
ls -lrt 
pipenv lock
deactivate 
cd 
ls -lrt 
prj
ls -lrt 
cd workstation-setup/
ls -lrt 
vim fedora-setup.sh 
ls -lrt 
rm 1
echo ${PWD}
vim .bash_functions 
cp .bash_functions ~/
cd 
source .bashrc 
prj python 
mkdir test 
cd test/
cf_env 
ls -lrt 
ls -la 
cd -
ls -la 
cd 
cd
prj 
cd workstation-setup/
vim .bashrc 
cp .bashrc ~/
cd 
source .bashrc 
prj python 
rm -rf test
md test 
cf_env 
prj python
cd test/
rm -rf * 
cf_env 
pipenv --three
cd 
vim .bashrc 
cd 
source .bashrc 
prj python
cd test/
ls -la 
pipenv --three
pip install virtualenv --user 
pipenv --three
cd
vim .bashrc 
source .bashrc 
cd -
prj python 
rm -rf test 
md test 
cf_env 
cd ../
md test2
cf_env 2
cd -
cd 
sudo poweroff 
sudo dnf update -y 
sudo reboot 
sudo dnf install postgresql 
dnf info capstone 
psql 
psql -h 192.168.1.154 -U thieryl 
psql -h 192.168.1.154 -U postgrep
psql -h 192.168.1.154 -U postgres
prj 
sudo reboot
URL="http://www.oracle.com"
JDK_DOWNLOAD_URL1="${URL}/technetwork/java/javase/downloads/index.html"
JDK_DOWNLOAD_URL2=`curl -s $JDK_DOWNLOAD_URL1 | egrep -o "\/technetwork\/java/\javase\/downloads\/jdk${JDK_VERSION}-downloads-.+?\.html" | head -1`
echo $JDK_DOWNLOAD_URL2
echo $JDK_DOWNLOAD_URL1
JDK_VERSION=10
JDK_DOWNLOAD_URL1="${URL}/technetwork/java/javase/downloads/index.html"
JDK_DOWNLOAD_URL2=`curl -s $JDK_DOWNLOAD_URL1 | egrep -o "\/technetwork\/java/\javase\/downloads\/jdk${JDK_VERSION}-downloads-.+?\.html" | head -1`
echo $JDK_DOWNLOAD_URL2
JDK_DOWNLOAD_URL3="${URL}${JDK_DOWNLOAD_URL2}"
JDK_DOWNLOAD_URL4=`curl -s $JDK_DOWNLOAD_URL3`
echo $JDK_DOWNLOAD_URL4
cat $JDK_DOWNLOAD_URL4| egrep -o "http\:\/\/download.oracle\.com\/otn-pub\/java\/jdk"
cat $JDK_DOWNLOAD_URL4 | egrep -o "http\:\/\/download.oracle\.com\/otn-pub\/java\/jdk"
echo $JDK_DOWNLOAD_URL4 | egrep -o "http\:\/\/download.oracle\.com\/otn-pub\/java\/jdk"
echo $JDK_DOWNLOAD_URL4 | egrep -o "http\:\/\/download.oracle\.com\/otn-pub\/java\/jdk\[1-0]"
echo $JDK_DOWNLOAD_URL4 | egrep -o "http\:\/\/download.oracle\.com\/otn-pub\/java\/jdk\[0-9]"
echo $JDK_DOWNLOAD_URL4 | egrep -o "http\:\/\/download.oracle\.com\/otn-pub\/java\/jdk*"
echo $JDK_DOWNLOAD_URL4 | egrep -o "http\:\/\/download.oracle\.com\/otn-pub\/java\/*"
echo $JDK_DOWNLOAD_URL4 | egrep -o "http\:\/\/download.oracle\.com\
"
echo $JDK_DOWNLOAD_URL4 | egrep  "http\:\/\/download.oracle\.com\
"
echo $JDK_DOWNLOAD_URL4 | egrep download 
echo $JDK_DOWNLOAD_URL4 | egrep  "http\:\/\/download.oracle\.com\/otn-pub\/java\/jdk*"
echo $JDK_DOWNLOAD_URL4 | egrep  "http\:\/\/download.oracle\.com\/otn-pub\/java\/jdk*"|grep 10 
echo $JDK_DOWNLOAD_URL4 | egrep  "http\:\/\/download.oracle\.com\/otn-pub\/java\/jdk*"|grep "10."
ls -latr
prj 
ls -lrt 
cd workstation-setup/
ls -ler
ls -lrt 
cp ~/.bash* .
ls -lrt 
ls -lrta
vim .bash_functions 
pwd 
cd -
for i in /home/dracul/Projects/workstation-setup/.bash*; do  ln -nsf $i ; done 
ls -lart 
cd ../
for i in /home/dracul/Projects/workstation-setup/.bash*; do  ln -nsf $i ; done 
ls -lart 
source .bashrc 
jdk_dload 1.7 tar.gz 
jdk_dload 7 tar.gz 
jdk_dload 8 tar.gz 
vim .bash_functions 
source .bashrc 
jdk_dload
prj 
cd workstation-setup/
wget https://gist.githubusercontent.com/n0ts/40dd9bd45578556f93e7/raw/0e9112d60fc0c9228a30e4c92d5e845df3bc1beb/get_oracle_jdk_linux_x64.sh
ls -lrt 
chmod u+x get_oracle_jdk_linux_x64.sh 
ls -lrt 
./get_oracle_jdk_linux_x64.sh 
./get_oracle_jdk_linux_x64.sh tar.gz
vim get_oracle_jdk_linux_x64.sh 
./get_oracle_jdk_linux_x64.sh tar.gz
vim get_oracle_jdk_linux_x64.sh 
wget https://gist.githubusercontent.com/gryf/8023f75bc586d97f8d75702e73def28d/raw/82fa30c96e8e6d18791b161d490171083021cea6/get_jdk.sh
chmod u+x get_jdk.sh 
./get_jdk.sh 
./get_jdk.sh 9
./get_jdk.sh 8
./get_jdk.sh 8 92 
wget https://gist.githubusercontent.com/gryf/8023f75bc586d97f8d75702e73def28d/raw/82fa30c96e8e6d18791b161d490171083021cea6/get_jdk.sh
chmod u+x get_jdk.sh.1 
./get_jdk.sh.1 
./get_jdk.sh.1 8 92 
ls -lrt 
rm -f get_* 
wget https://gist.githubusercontent.com/gryf/8023f75bc586d97f8d75702e73def28d/raw/82fa30c96e8e6d18791b161d490171083021cea6/get_jdk.sh
chmod u+x get_jdk.sh 
./get_jdk.sh 
rn -f get_jdk.sh 
rm  -f get_jdk.sh 
wget https://gist.githubusercontent.com/mrmichalis/85fa7bd334e0f31dec4b69c9e7853cff/raw/736b44951ef8cc718760ec659db9a165b8209083/gistfile1.txt
mv gistfile1.txt get_jdk.sh 
chmod u+x get_jdk.sh 
./get_jdk.sh 
./get_jdk.sh tar
vi  get_jdk.sh 
./get_jdk.sh tar 9 
./get_jdk.sh tar 10
./get_jdk.sh tar 10.1
./get_jdk.sh tar 10.0.2
vim get_jdk.sh 
cd 
psql -h 192.168.1.154 -U postgres 
psql -h 192.168.1.154 -U thieryl test 
sudo reboot 
sudo dnf update -y 
sudo reboot 
pej
prj
ls -lrt 
cd PYTHON/
ls -lrt 
gti clone git@github.com:thieryl/recipe_app.git
git clone git@github.com:thieryl/recipe_app.git
cd recipe_app/
ls -lrt 
python3 -m venv .venv 
touch .env .evv.leave 
vim .env .env.leave 
ls -la 
rm .evv.leave 
cd -
git branch -a
git checkout add_user_registration 
ls -lrt 
pip install -r requirements.txt 
cd 
sudo reboot 
