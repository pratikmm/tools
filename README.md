# MatirxDS Public Tools
This repository contains the docker files and related configurations for [MatrixDS](http://matrixds.com) compatible tool containers. The [MatrixDS](http://matrixds.com) community platform is a data science community environment that runs on a kubernetes engine. Project a network directory containing files, code, data, and dependencies. The project directory is mounted, as a file system, onto different environments (tools). 

The subdirectories in this repo contain all the files necessary for an automated build on docker hub. The docker hub site can [be found here.](https://hub.docker.com/u/matrixds/dashboard/). See the README file in each directory for tool-specific information.

## Custom Tools

MatrixDS will allow any custom container to be run as either a UI or serverless (called a Job). Use the other tool Dockerfile as a guide to building a compatible environment. 
