#!/usr/bin/bash

#sudo apt install figlet -y

figlet "naiad set-up"
echo このウィザードでは、naiad Linuxの不足している機能をインストールします。
echo
echo 続行するにはアカウントのパスワードを入力して下さい...
sudo echo rootアクセスに成功しました

#レポジトリ追加
sudo add-apt-repository ppa:mikhailnov/pulseeffects -y
sudo add-apt-repository ppa:morphis/anbox-support -y
sudo apt update

#各種インストール
sudo apt install pulseeffects pulseaudio --install-recommends -y
sudo apt install anbox-modules-dkms -y
sudo modprobe ashmem_linux
sudo modprobe binder_linux
sudo snap install --devmode --beta anbox
sudo snap refresh --beta --devmode anbox

#grubテーマインストール
cd /usr/share/naiad-linux/Tela-1080p
sudo ./install.sh
cd ..
sudo rm -r Tela-1080p

#壁紙
cd
mkdir setup-tmp
cd setup-tmp
FILE_ID=11wssCPJdHz-gXbyx5kX_e1yzk7gygquE
FILE_NAME=naiad-linux-wallpaper.zip
curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=${FILE_ID}" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"  
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=${FILE_ID}" -o ${FILE_NAME}
unzip naiad-linux-wallpaper.zip
cp -pR wallpaper /usr/share/xfce4/backdrops

figlet "Done!"
echo ================
echo 全て完了しました。
echo ================