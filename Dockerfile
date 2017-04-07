FROM jarvice/app-torch:latest
MAINTAINER Nimbix, Inc

USER root
ADD ./scripts/install-neural-style.sh /usr/local/scripts/neural-style/install-neural-style.sh
USER nimbix
RUN /bin/bash /usr/local/scripts/neural-style/install-neural-style.sh
USER root
ADD ./scripts /usr/local/scripts/neural-style
USER nimbix

ADD ./NAE/AppDef.json /etc/NAE/AppDef.json
USER nimbix
