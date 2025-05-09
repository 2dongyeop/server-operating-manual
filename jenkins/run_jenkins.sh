docker run -d \
  --name jenkins \
  -p 17776:8080 \
  -v /wisoft/jenkins:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /wisoft:/wisoft \
  jenkins/jenkins:lts