#uninstall older versions
$ sudo apt-get remove docker docker-engine docker.io containerd runc

#get updates
$ sudo apt-get update

#install required packages
$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

#Add Docker’s official GPG key:
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#Verify that you now have the key with the fingerprint 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88, by searching for the last 8 characters of the fingerprint.
$ sudo apt-key fingerprint 0EBFCD88

#set stable repository
$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

#get updates
$ sudo apt-get update

#install docker
$ sudo apt-get install docker-ce docker-ce-cli containerd.io
$ sudo apt-get install -y docker-ce=18.06.1~ce~3-0~ubuntu

#see the docker version 
docker version 

#add custom user to docker group
sudo usermod -a -G docker user

#verify the membership
grep docker /etc/group 