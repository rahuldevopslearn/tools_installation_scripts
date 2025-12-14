##Install in Amazon Ubuntu
sudo usermod -aG docker $USER
docker pull docker.bintray.io/jfrog/artifactory-oss:latest
sudo mkdir -p /jfrog/artifactory
sudo chown -R 1030 /jfrog/
docker run --name artifactory -d -p 8081:8081 -p 8082:8082 -v /jfrog/artifactory:/var/opt/jfrog/artifactory docker.bintray.io/jfrog/artifactory-oss:latest

docker volume create artifactory-data
docker pull releases-docker.jfrog.io/jfrog/artifactory-oss:7.59.9
docker run -d --name artifactory -p 8081:8081 -p 8082:8082 -v artifactory-data:/var/opt/jfrog/artifactory --restart unless-stopped releases-docker.jfrog.io/jfrog/artifactory-oss:7.59.9
#Verify container & Java version
docker ps
docker logs artifactory | head
docker exec -it artifactory java -version

#Default credentials
Username: admin
Password: password
