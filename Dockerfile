FROM python:3.9.10-slim-bullseye

ENV DEBIAN_FRONTEND=noninteractive

# install general packages
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  ghostscript \
  # fonts
  cabextract \
  xfonts-utils \
  fontconfig \
  wget && \
  # Install Fonts
  wget http://ftp.jp.debian.org/debian/pool/contrib/m/msttcorefonts/ttf-mscorefonts-installer_3.8_all.deb && \
  dpkg -i ttf-mscorefonts-installer_3.8_all.deb && \
  fc-cache -fv && \
  # clean to reduce image size
  apt-get clean -y && \
  apt-get autoremove -y && \
  apt-get autoclean -y && \
  rm -rf /var/lib/apt/lists/*

# Install scpy
RUN pip install --upgrade pip && \
  pip install scipy matplotlib numpy pandas black

WORKDIR /workdir

ENTRYPOINT [ "python" ]
CMD [ "-help" ]
