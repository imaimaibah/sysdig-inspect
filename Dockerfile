FROM debian

COPY sysdig-inspect_latest_amd64.deb /var/tmp

RUN apt-get update && \
    bash -c "dpkg -i /var/tmp/*.deb;apt-get -f install -y" && \
    apt-get install -y libxss1 libasound2-dev && \
    rm -f /var/tmp/* /var/lib/apt/lists/*

ENV DISPLAY=:0
VOLUME ['/tmp/.X11-unix']
ENTRYPOINT ["/bin/bash","-c"]
CMD ["/usr/bin/sysdig-inspect"]
