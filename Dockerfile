FROM python:3.9.10-slim-bullseye

ENV DEBIAN_FRONTEND=noninteractive

# install general packages
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  dvipng texlive-latex-extra texlive-fonts-recommended cm-super fonts-noto-cjk ghostscript && \
  # clean to reduce image size
  apt-get clean -y && \
  apt-get autoremove -y && \
  apt-get autoclean -y && \
  rm -rf /var/lib/apt/lists/*

# Install scpy
RUN pip install --upgrade pip && \
  pip install scipy matplotlib numpy pandas black SciencePlots

WORKDIR /workdir

ENTRYPOINT [ "python" ]
CMD [ "-help" ]
