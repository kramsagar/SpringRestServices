https://github.com/kramsagar/SpringRestServices/blob/main/Jenkinsfile


Usecase:   create springboot ms api docker image and push to docker hub

1.  docker file has instructions to how to create docker image post jenkinsfile created artifact in slave node
2.  jenkin configured with slave node as azure vm
3.  Jenkins pipeline created with tools - mave, jdk and configured with github , dockerhub , azure vm instance credentials.
4.  jenkins slave node azure vm configured with docker setup, created a devops user and added user to docker group to get access for jenkin to run docker commands on slave node.

Architecture:   github (every merge event) --> Jenkins multibranch pipeline --> Jenkins server --> Launch Azure vm (slave node) for build task -> it create springboot app instance and push image to docker hub



