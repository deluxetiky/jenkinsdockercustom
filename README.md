# jenkinsdockercustom
Custom jenkins docker configuration.

Run Docker Jenkins Container

docker run -it -d --name jenkins -v {HomePathOnHost}:/var/jenkins_home  -p 8080:8080 -p 5000:5000 1306130010/jenkins.netcore
