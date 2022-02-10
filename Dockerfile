FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

# install general packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    ghostscript \
    # fonts
    cabextract \
    xfonts-utils \
    wget && \
    # Install Fonts
    wget http://ftp.jp.debian.org/debian/pool/contrib/m/msttcorefonts/ttf-mscorefonts-installer_3.8_all.deb && \
    dpkg -i ttf-mscorefonts-installer_3.8_all.deb && \
    apt-get install -y --no-install-recommends fontconfig \
    fonts-ipafont \
    fonts-ipaexfont && \
    fc-cache -fv && \
    # clean to reduce image size
    apt-get clean -y && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    rm -rf /var/lib/apt/lists/*

# Install scpy
RUN pip install --upgrade pip && \
    pip install scipy matplotlib numpy pandas && \
    pip install scipy matplotlib numpy pandas -U

WORKDIR /workdir

ENTRYPOINT [ "python3" ]
CMD [ "-help" ]
