# FROM anzawatta/ubuntu19.10
FROM ubuntu:19.10

WORKDIR /tmp

# Basic tools
RUN apt update && \
    apt install -y \
      curl \
      git \
      make \
      unzip \
      vim \
      wget \
      unzip \
      ghostscript
# texlive
RUN apt install -y --no-install-recommends  \
      latexmk \
      lmodern \
      texlive-latex-recommended \
      texlive-latex-extra \
      texlive-lang-japanese \
      texlive-lang-cjk \
      texlive-luatex \
      texlive-xetex

WORKDIR /usr/src

# Install jlreq
RUN git clone https://github.com/abenori/jlreq && \
    cd jlreq && \
    make && \
    make install
# Link fonts
RUN mkdir -p /usr/local/share/texmf/fonts && \
    ln -s /docs/fonts /usr/local/share/texmf/fonts/truetype
RUN mktexlsr
# Install Python
RUN apt install -y --no-install-recommends \
      graphviz \
      python3 \
      python3-dev \
      python3-pip \
      python3-pil \
      ghostscript && \
    apt autoremove && \
    apt clean && \
    apt autoclean
RUN python3 -m pip install --upgrade pip

WORKDIR /
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

RUN mkdir /docs
WORKDIR /docs

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
