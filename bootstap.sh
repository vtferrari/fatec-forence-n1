#/bin/sh
echo -n "Deseja instalar os headers do sistema (y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
   apt-get update
   apt-get install linux-headers-amd64
fi

echo -n "Deseja instalar os liME (y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
   rm -rf ./*.zip
   rm -rf ./LiME-master
   wget https://github.com/504ensicsLabs/LiME/archive/master.zip 
   unzip ./master.zip 
   cd ./LiME-master/src/
   make
fi

echo -n "Deseja extrair evidencias (y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
   rm -rf ./forence/
   mkdir ./forence/
   rmmod lime
   insmod ./LiME-master/src/lime-*.ko "path=./forence/memlime.raw format=lime"
   strings ./forence/memlime.raw > ./forence/memlime.txt
   w > ./forence/logados.txt
   uname -r -n > ./forence/uname.txt
   ps -eo user,tty,pid,cmd,start | grep joao > ./forence/user_joao.txt
   uptime > ./forence/uptime.txt
   netstat tunap > ./forence/netstat_tunap.txt
   netstat -nat > ./forence/netstat_nat.txt
   dpkg -l > ./forence/dpkg.txt
   date > ./forence/datetime.txt
   df -hT > ./forence/mountdsk.txt
   fdisk -l > ./forence/fdisk.txt
   ifconfig > ./forence/ifconfig.txt
   route -n > ./forence/route.txt
   lsmod > ./forence/lsmod.txt
   md5sum ./forence/memlime.txt > ./forence/memlime.txt.md5
   sha256sum ./forence/memlime.txt > ./forence/memlime.txt.sha256
fi

