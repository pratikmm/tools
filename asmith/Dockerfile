FROM ubuntu:18.04

RUN apt-get update

# Install base packages
RUN apt-get install -y \
    apt \
    bash-completion \
    ca-certificates \
    gnupg2 \
    locales \
  && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
  && locale-gen en_US.utf8 \
  && /usr/sbin/update-locale LANG=en_US.UTF-8

# make the "en_US.UTF-8" locale so postgres will be utf-8 enabled by default
ENV LANG=en_US.utf8 \
    LC_ALL=en_US.UTF-8 \
    TERM=xterm \
    APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

# R Repo, see https://cran.r-project.org/bin/linux/ubuntu/README.html
RUN echo 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN apt-get update


# Install base packages
RUN apt-get install -y --no-install-recommends \
    default-jdk \
    default-jre \
    file \
    fonts-texgyre \
    g++ \
    gfortran \
    gsfonts \
    icu-devtools \
    libblas-dev \
    libcurl4 \
    libcurl4-gnutls-dev \
    libgdal-dev \
    libglu1-mesa-dev \
    libgmp3-dev \
    libicu60 \
    libjpeg-turbo8 \
    libmagick++-dev \
    libmariadb-client-lgpl-dev \
    libmpfr-dev \
    libncurses5-dev \
    libnlopt-dev \
    libopenblas-dev \
    libpangocairo-1.0-0 \
    libpng16-16 \
    libpq-dev \
    libsasl2-dev \
    libssl-dev \
    libtiff5 \
    libudunits2-dev \
    libxml2-dev \
    make \
    mesa-common-dev \
    openjdk-8-jdk \
    sudo \
    texlive-xetex \
    unzip \
    zip \
    zlib1g-dev

# Set timezone noninteractively
RUN ln -fs /usr/share/zoneinfo/US/Pacific /etc/localtime

# R-specific packages
RUN apt-get install -y --no-install-recommends \
    r-base-core \
    r-base-dev

# Python stuff
RUN apt-get install -y --no-install-recommends \
    python3-pip \
  && apt-get clean
