#Add required utilities to Centos
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

#Setup the Stable Repository
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

#Install Docker CE
sudo yum -y install docker-ce


#Enable and start Docker
sudo systemctl start docker && sudo systemctl enable docker

#Add customuser to the docker group
sudo usermod -aG docker custom_user

#logout and login again to get permissions


