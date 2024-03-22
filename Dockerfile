FROM python:3

RUN apt-get update
RUN apt-get -y install curl
RUN apt-get -y install gfortran
RUN apt-get -y install openmpi-bin libopenmpi-dev
RUN apt-get -y install libblas-dev liblapack-dev
RUN apt-get -y install cmake
RUN apt-get -y install git


COPY requirements.txt requirements-dev.txt ./

 RUN pip install --no-cache-dir --upgrade pip \
   && pip install --no-cache-dir -r requirements.txt \
   && pip install --no-cache-dir -r requirements-dev.txt
