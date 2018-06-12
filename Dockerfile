FROM ubuntu:16.04
LABEL maintainer=seokchan.ahn@kaist.ac.kr

ENV HOME /root
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install some useful apps
RUN apt-get update && \
		apt-get install -y sudo && \
		sudo apt-get install -y --no-install-recommends apt-utils && \
		apt-get install -y \
			wget \
			tar \
			make \
			patch \
			vim \
			git \
			gdb \
		locales locales-all && \
		locale-gen ko_KR.UTF-8

# Set default messages to English
ENV LC_ALL en_US.UTF-8
# Make available input Korean character
ENV LANG ko_KR.UTF-8

# Refer to https://gist.github.com/minsuu/19a271ccf366e168501685c2bc2d6f03
WORKDIR $HOME
ADD ./install.sh .
RUN chmod +x ./install.sh
RUN ./install.sh
RUN rm ./install.sh

# Install pip for install gdbgui
RUN sudo apt-get update && \
		sudo apt-get install -y python-pip && \
		pip install --upgrade pip

# Install gdbgui https://gdbgui.com/
RUN pip install gdbgui

# Install fuser for debugging
RUN apt-get install psmisc

# Remove redundant files
RUN rm -rf bochs-2.2.6.tar.gz pintos.tar.gz sse-gcc-installer-v3

# Set working directory
WORKDIR $HOME/pintos/src
