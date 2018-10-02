FROM rocker/rstudio:3.5.1

COPY packages.R /usr/local/lib/R/packages.R

RUN \
  apt-get update && apt-get install -y && \
  DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
    default-jre default-jdk r-base-core icu-devtools zlib1g-dev libncurses5-dev libsasl2-dev libnlopt-dev libgmp3-dev libglu1-mesa-dev \
    libssl-dev libxml2-dev openjdk-8-jdk  r-cran-rjava libmariadb-client-lgpl-dev r-cran-rgl libmpfr-dev \
    libpq-dev texlive-xetex libgdal-dev libudunits2-dev libmagick++-dev \
    && apt-get clean && \
  R CMD javareconf && \
  Rscript /usr/local/lib/R/packages.R

COPY entrypoint.sh /entrypoint.sh

RUN   usermod -u 1100 rstudio && \
      groupmod -g 1100 rstudio && \
      chown -R rstudio:rstudio /home/rstudio && \
      chmod +x /entrypoint.sh

ENV PASSWORD matrix
ENV DISABLE_AUTH true
ENV ROOT TRUE 
WORKDIR /home/rstudio


ENTRYPOINT ["sh", "-c", "/entrypoint.sh >>/var/log/stdout.log 2>>/var/log/stderr.log"]
#CMD ["/init"]

