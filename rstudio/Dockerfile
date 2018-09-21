FROM gcr.io/matrixdev-174116/rstudio:0.1.11

RUN \
  apt-get update -y && \
  apt install -y sudo icu-devtools zlib1g-dev libncurses5-dev libsasl2-dev \
  libssl-dev libxml2-dev openjdk-8-jdk  r-cran-rjava libmariadb-client-lgpl-dev \
  libpq-dev texlive-xetex libgdal-dev libudunits2-dev && \
  apt-get clean

COPY entrypoint.sh /entrypoint.sh
COPY encrypted-sign-in.htm /usr/lib/rstudio-server/www/templates/encrypted-sign-in.htm
COPY packages.R /usr/lib/rstudio-server/R

RUN \
  R CMD javareconf && \
  Rscript /usr/lib/rstudio-server/R/packages.R && \
  usermod -u 1100 rstudio && \
  groupmod -g 1100 rstudio && \
  chown -R rstudio:rstudio /home/rstudio && \
  chmod +x /entrypoint.sh

ENTRYPOINT ["sh", "-c", "/entrypoint.sh >>/var/log/stdout.log 2>>/var/log/stderr.log"]
