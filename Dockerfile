FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# install general packages
RUN apt update && \
    apt install -y --no-install-recommends \
    python3 \
    python3-pip && \
    # Install Fonts
    echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections && \
    apt-get install -y --no-install-recommends fontconfig ttf-mscorefonts-installer \
    fonts-ipafont \
    fonts-ipaexfont \
    fontconfig && \
    fc-cache -fv && \
    # clean to reduce image size
    apt-get clean -y && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    rm -rf /var/lib/apt/lists/*

# Install scpy
RUN pip install --upgrade pip && \
    pip install scipy matplotlib numpy pandas jupyter

ENTRYPOINT [ "python3" ]
CMD [ "-help" ]
