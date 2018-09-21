FROM gcr.io/matrixdev-174116/rstudio:0.1.11

COPY packages.R /usr/local/lib/R/packages.R
COPY encrypted-sign-in.htm /usr/lib/rstudio-server/www/templates/encrypted-sign-in.htm
COPY entrypoint.sh /entrypoint.sh

RUN \
  apt-get update && apt-get install -y && \
  DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
    r-base-core icu-devtools zlib1g-dev libncurses5-dev libsasl2-dev libnlopt-dev libgmp3-dev \
    libssl-dev libxml2-dev openjdk-8-jdk  r-cran-rjava libmariadb-client-lgpl-dev r-cran-rgl \
    libpq-dev texlive-xetex libgdal-dev libudunits2-dev && apt-get clean && \
  R CMD javareconf && \
  Rscript /usr/local/lib/R/packages.R && \
  usermod -u 1100 rstudio && \
  groupmod -g 1100 rstudio && \
  chown -R rstudio:rstudio /home/rstudio && \
  chmod +x /entrypoint.sh

ENTRYPOINT ["sh", "-c", "/entrypoint.sh >>/var/log/stdout.log 2>>/var/log/stderr.log"]
