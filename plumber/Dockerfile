FROM rocker/r-base

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
  # Create and use plumber user
RUN groupadd --gid=1100 plumber && \
    useradd --create-home --uid=1100 --gid=1100 plumber && \
    chown -R plumber:plumber /home/plumber && \
    chmod +x /entrypoint.sh

#RUN mkdir -p /home/plumber/plumber

#COPY plumber.R /home/plumber/plumber/plumber.R

USER plumber
WORKDIR /home/plumber
EXPOSE 8000

ENTRYPOINT ["sh", "-c", "/entrypoint.sh >>/var/log/stdout.log 2>>/var/log/stderr.log"]
#ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='0.0.0.0', port=8000)"]
#CMD ["/usr/local/lib/R/site-library/plumber/examples/04-mean-sum/plumber.R"]