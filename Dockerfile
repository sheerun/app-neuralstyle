FROM jarvice/app-torch:latest
MAINTAINER Nimbix, Inc

USER root
ADD ./scripts /usr/local/scripts/neural-style
RUN /bin/bash /usr/local/scripts/neural-style/install-neural-style.sh

USER nimbix
