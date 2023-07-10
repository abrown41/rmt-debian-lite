# create new
FROM debian:stable-slim
MAINTAINER Andrew BRown <andrew.brown@qub.ac.uk>

RUN apt-get update
RUN apt-get -y install curl
RUN apt-get -y install gfortran
RUN apt-get -y install python3
RUN apt-get -y install openmpi-bin libopenmpi-dev
RUN apt-get -y install libblas-dev liblapack-dev
RUN apt-get -y install cmake
RUN apt-get -y install python3.11-venv


