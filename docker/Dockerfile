FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install -y curl libxml2-dev
RUN apt install -y dirmngr \
  gnupg \
  apt-transport-https \
  ca-certificates \
  software-properties-common
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
RUN apt install -y 
RUN apt install -y r-base

        