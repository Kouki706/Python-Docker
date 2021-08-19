FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# install general packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3.9 \
    python3-pip \
    make && \
    # Install Fonts
    echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections && \
    apt-get install -y --no-install-recommends ttf-mscorefonts-installer \
    fonts-ipafont fonts-ipaexfont \
    fontconfig && \
    fc-cache -fv && \
    # clean to reduce image size
    apt-get clean -y && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    rm -rf /var/lib/apt/lists/*

# Install scpy
RUN python3.9 -m pip install --upgrade pip && \
    python3.9 -m pip install scipy matplotlib numpy pandas jupyter black
