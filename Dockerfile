FROM kyungw00k/lrun:1.1.4

LABEL maintainer Kyungwook Park <parksama@gmail.com>

ENV LJUDGE_VERSION=0.6.1

# INSTALL LJUDGE BINARY
RUN wget "https://github.com/quark-zju/ljudge/releases/download/v${LJUDGE_VERSION}/ljudge_${LJUDGE_VERSION}_amd64.deb" && \
    dpkg -i "ljudge_${LJUDGE_VERSION}_amd64.deb" && \
    rm -f "ljudge_${LJUDGE_VERSION}_amd64.deb"

CMD ["/usr/bin/ljudge"]
