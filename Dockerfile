FROM debian:jessie

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    autoconf \
    automake \
    build-essential \
    ca-certificates \
    git \
    libcairo2-dev \
    libicu-dev \
    libleptonica-dev \
    libpango1.0-dev \
    libpng12-dev \
    libtiff5-dev \
    libtool \
    zlib1g-dev \
  && git clone --branch 3.04.01 https://github.com/tesseract-ocr/tesseract.git /tmp/tesseract \
  && cd /tmp/tesseract \
  && ./autogen.sh \
  && ./configure \
  && make \
  && make install \
  && make training \
  && make training-install \
  && ldconfig \
  && cd / \
  && apt-get purge --auto-remove -y \
    autoconf \
    automake \
    build-essential \
    ca-certificates \
    git \
    libtool \
  && apt-get clean \
  && rm -rf /tmp/tesseract /var/lib/apt/lists/*