# Install Docker
```bash
sudo apt-get update 
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
 ```
 
 ```bash
 sudo mkdir -p /etc/apt/keyrings
 curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

```bash
 echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

```bash
sudo apt-get update
```

```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/v2.12.2/docker-compose-$(uname -s)-$(uname -m)"  -o /usr/local/bin/docker-compose
sudo mv /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
```

 ### Check docker
 
```bash
sudo docker run hello-world
``` 



# Install nginxproxymanager

```bash docker volume create nginxproxymanager-data
docker volume create nginxproxymanager-letsencrypt

docker run -d \
  --restart=unless-stopped \
  --net=host \
  -p 80:80 \
  -p 443:443 \
  -p 81:81 \
  -v nginxproxymanager-data:/data \
  -v nginxproxymanager-letsencrypt:/etc/letsencrypt \
  --name nginxproxymanager \
  jc21/nginx-proxy-manager:latest
```
  
  # Install Firewall
  
  ```bash
    apt install ufw && ufw deny 81 && ufw allow ssh
  ```
  
  ### Write in new console
  
  ```bash 
    ufw enable
  ```
  
  # Go to setup directory
  ```bash
  cd /var/opt/
  ```
  

  
  # Install git 
  ```bash
  sudo apt-get install git-all
  ```
  
  # Setup repository 
  
  ```bash
  git clone https://github.com/dev-eugen/Setup.git .
  ```
  
  # Install vim
  ```bash
  apt-get install vim
  ```
