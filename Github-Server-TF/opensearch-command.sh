sudo apt-get install python3-pip -y
sudo pip3 install docker-compose
mkdir opensearch
cd opensearch
nano docker-compose.yml # create docker compose file
docker-compose up -d
docker ps

#install filebeat in to the server
sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
sudo tee /etc/yum.repos.d/elastic.repo <<EOF
[elastic-7.x]
name=Elastic repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF
sudo yum install filebeat -y

sudo nano /etc/filebeat/filebeat.yml # create filebeat file

sudo filebeat modules enable elasticsearch
sudo filebeat setup
sudo service filebeat start

