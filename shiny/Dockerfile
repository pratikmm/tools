FROM rocker/shiny:3.5.1

COPY packages.R /usr/local/lib/R/packages.R
COPY entrypoint.sh /entrypoint.sh

RUN \
  apt-get update && apt-get install -y && \
  DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
<<<<<<< HEAD
    r-base-core icu-devtools zlib1g-dev libncurses5-dev libsasl2-dev libnlopt-dev libbz2-dev libmagick++-dev \
    libssl-dev libxml2-dev openjdk-8-jdk  r-cran-rjava libmariadb-client-lgpl-dev libglu1-mesa-dev \
    libpq-dev texlive-xetex libgdal-dev libudunits2-dev libgmp3-dev libmpfr-dev && apt-get clean && \
=======
    r-base-core icu-devtools zlib1g-dev libncurses5-dev libsasl2-dev libnlopt-dev libgmp3-dev \
    libssl-dev libxml2-dev openjdk-8-jdk  r-cran-rjava libmariadb-client-lgpl-dev \
    libpq-dev texlive-xetex libgdal-dev libudunits2-dev && apt-get clean && \
>>>>>>> 5e74d8fe344beb291d4475c84b1b4d3d47e8285d
  R CMD javareconf && \
  Rscript /usr/local/lib/R/packages.R && \
  usermod -u 1100 shiny && \
  groupmod -g 1100 shiny && \
  chown -R shiny:shiny /srv && \
  chmod +x /entrypoint.sh

ENTRYPOINT ["sh", "-c", "/entrypoint.sh >>/var/log/stdout.log 2>>/var/log/stderr.log"]
