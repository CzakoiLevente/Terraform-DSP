#update packages
sudo apt-get update
#Install packages to allow apt to use repository over https
sudo apt-get install \
apt-transport-https \
ca-certificates \
curl \
software-properties-common
#Add docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu | sudo apt-key add -
#Add key fingerprint
sudo apt-key fingerprint 0EBFCD88
#Update index
sudo apt-get update
#install docker 
sudo apt-get install docker-ce
#install git
sudo apt-get install -y git
#docker as a non-root user
sudo groupadd docker
sudo usermod -aG docker $USER
#create package.json file
npm init -y
#install node package manager
npm install
#install node and add dependency in json
npm install node --save
#install express and add dependency in json
npm install express --save
#create 'developer' user
useradd -s /bin/bash -m -d /home/developer developer
echo "asdf" | passwd developer --stdin
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
service sshd restart
