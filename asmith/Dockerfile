FROM ubuntu:18.04

USER root

ENV DEBIAN_FRONTEND noninteractive

# Install all basic OS dependencies
RUN apt-get update
RUN apt-get install -yq --no-install-recommends \
    apt \
    apt-utils \
    bash-completion \
    build-essential \
    byacc \
    bzip2 \
    ca-certificates \
    emacs \
    file \
    flex \
    fonts-dejavu \
    fonts-liberation \
    fonts-texgyre \
    g++ \
    gcc \
    gettext \
    gfortran \
    git \
    gnupg2 \
    gsfonts \
    hdf5-tools \
    icu-devtools \
    jed \
    lmodern \
    locales \
    make \
    mesa-common-dev \
    nano \
    netcat \
    openjdk-8-jdk \
    pandoc \
    software-properties-common \
    sudo \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-xetex \
    tzdata \
    unzip \
    vim \
    wget \
    zip \
  && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
  && locale-gen en_US.utf8 \
  && /usr/sbin/update-locale LANG=en_US.UTF-8

# make the "en_US.UTF-8" locale so postgres will be utf-8 enabled by default
ENV LANG=en_US.utf8 \
    LC_ALL=en_US.UTF-8 \
    TERM=xterm \
    APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

# Install additional libraries
RUN apt-get install -yq --no-install-recommends \
    libsm6 \
    libxext-dev \
    libxrender1 \
    libblas-dev \
    libcurl4 \
    libcurl4-gnutls-dev \
    libgdal-dev \
    libgmp3-dev \
    libicu60 \
    libjpeg-turbo8 \
    libmagick++-dev \
    libmariadb-client-lgpl-dev \
    libmpfr-dev \
    libncurses5-dev \
    libnettle6 \
    libnlopt-dev \
    libopenblas-dev \
    libpango1.0-0 \
    libpangocairo-1.0-0 \
    libpng16-16 \
    libpq-dev \
    libsasl2-dev \
    libssl-dev \
    libtiff5 \
    libtool \
    libudunits2-dev \
    libxml2-dev \
    zlib1g-dev

# Set timezone noninteractively
RUN ln -fs /usr/share/zoneinfo/US/Pacific /etc/localtime

# Python stuff
RUN apt-get install -y --no-install-recommends \
    python-pip \
    python-setuptools \
    python-wheel \
    python-dev \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    python3-dev \
  && apt-get clean

# R Repo, see https://cran.r-project.org/bin/linux/ubuntu/README.html
RUN echo 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN apt-get update

# R-specific packages
RUN apt-get install -y --no-install-recommends \
    r-base-core \
    r-base-dev \
    r-cran-boot \
    r-cran-class \
    r-cran-cluster \
    r-cran-codetools \
    r-cran-foreign \
    r-cran-kernsmooth \
    r-cran-lattice \
    r-cran-mass \
    r-cran-matrix \
    r-cran-mgcv \
    r-cran-nlme \
    r-cran-nnet \
    r-cran-rpart \
    r-cran-spatial \
    r-cran-survival
COPY r_packages.R .
RUN R CMD javareconf \
  && Rscript r_packages.R \
  && rm r_packages.R

# Install experimental dependencies
# RUN apt-get install -y --no-install-recommends \

# Add Tini
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

RUN apt-get clean \
  && rm -rf /var/lib/apt/lists/*
