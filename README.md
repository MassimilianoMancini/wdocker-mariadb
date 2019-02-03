[![Build Status](https://dev.azure.com/AwesomeContainer/AzurePipeline/_apis/build/status/mariadb/AzurePipeline-wdocker-mariadb-dev?branchName=dev)](https://dev.azure.com/AwesomeContainer/AzurePipeline/_build/latest?definitionId=5&branchName=dev)
![Pulls from Docker Hub](https://img.shields.io/docker/pulls/awesomecontainer/wdocker-mariadb.svg?style=flat)
![Stars on Docker Hub](https://img.shields.io/docker/stars/awesomecontainer/wdocker-mariadb.svg?style=flat)
![Number of layers in container image](https://img.shields.io/microbadger/layers/awesomecontainer/wdocker-mariadb.svg?style=flat)

# wdocker-mariadb
Windows Docker container: MariaDB.

Provided as-is. I do not own the software used in this container nor do I support it. If there is an issue with the container, please open up an issue on GitHub.

## Introduction
This is a Windows container, built using Docker.  In order to use this container, you have to be running Windows 10 1809 or Window Server 1809 and a recent copy of Docker up and running. 

## Running this container
To run this container, try using docker-compose. Adjust [docker-compose.yml](https://github.com/AwesomeContainer/wdocker-mariadb/blob/master/docker-compose.yml) and save it in a local directory. Run the container:

  `docker-compose up -d`

You can update this container using docker-compose:

  `docker-compose pull`
  
  `docker-compose up -d`

If you don't want to use docker-compose, you can run this container directly from Docker Hub using Docker.exe:

  `docker run -d -p 3306:3306 --name mariadb -v C:\DockerData\mariadb:c:\mariadbdata awesomecontainer/wdocker-mariadb`
