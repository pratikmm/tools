FROM rocker/shiny:3.5.1

COPY packages.R /usr/local/lib/R/packages.R
COPY entrypoint.sh /entrypoint.sh

RUN \
  apt-get update && apt-get install -y && \
  DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
    r-base-core icu-devtools zlib1g-dev libncurses5-dev libsasl2-dev libnlopt-dev libgmp3-dev \
    libssl-dev libxml2-dev openjdk-8-jdk  r-cran-rjava libmariadb-client-lgpl-dev r-cran-rgl \
    libpq-dev texlive-xetex libgdal-dev libudunits2-dev && apt-get clean && \
  R CMD javareconf && \
  Rscript /usr/local/lib/R/packages.R 

  # Create and use plumber user
RUN groupadd --gid=1100 plumber && \
    useradd --create-home --uid=1100 --gid=1100 plumber && \
    echo 'plumber ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers

USER plumber
WORKDIR /home/plumber
EXPOSE 8000

ENTRYPOINT ["sh", "-c", "/entrypoint.sh >>/var/log/stdout.log 2>>/var/log/stderr.log"]
