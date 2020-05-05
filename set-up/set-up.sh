#!/usr/bin/bash
echo ======
echo NAIAD Linux set up A-02
echo
echo ======
echo このウィザードでは、naiad Linuxの不足している機能をインストールします。
echo
echo 続行するには管理アカウントのパスワードを入力して下さい...
sudo echo rootアクセスに成功しました
sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
sudo add-apt-repository ppa:mikhailnov/pulseeffects -y
sudo apt update
sudo apt install gimp
sudo apt install pulseeffects pulseaudio --install-recommends
cd Tela-1080p
sudo ./install.sh
cd ..
rm -r Tela-1080p

sudo apt-get autoremove
#cd /usr/share/altair-linux/app
#sudo unzip app-youtube-music.zip
#sudo unzip app-google-doc.zip
#sudo unzip app-submarin.zip
cd
echo ====
echo easy anbox installer
echo c 2020 AltairLinux team
echo ====
sudo echo started
sudo add-apt-repository ppa:morphis/anbox-support
sudo apt update
sudo apt install anbox-modules-dkms
sudo modprobe ashmem_linux
sudo modprobe binder_linux
sudo snap install --devmode --beta anbox
sudo snap refresh --beta --devmode anbox
echo ====
echo 全て完了しました。
echo ===


