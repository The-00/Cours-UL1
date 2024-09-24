FROM alpine:latest

MAINTAINER Théau TROVA<theau.trova@ens-lyon.fr>
ENV PASS=moi

#=====================================================
# PROXY-LYON1  (a deésactiver a l'exterieur de la fac)
#=====================================================

ENV http_proxy=http://proxy.univ-lyon1.fr:3128
ENV ftp_proxy=http://proxy.univ-lyon1.fr:3128
ENV https_proxy=http://proxy.univ-lyon1.fr:3128
ENV all_proxy=http://proxy.univ-lyon1.fr:3128
ENV HTTP_PROXY=http://proxy.univ-lyon1.fr:3128
ENV FTP_PROXY=http://proxy.univ-lyon1.fr:3128
ENV HTTPS_PROXY=http://proxy.univ-lyon1.fr:3128
ENV ALL_PROXY=http://proxy.univ-lyon1.fr:3128

#=====================================================
# INSTALLATION S6
#=====================================================

RUN apk add --no-cache curl && \
    curl -L "https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.3/s6-overlay-amd64.tar.gz" | tar zxvf - -C /

#=====================================================
# INSTALLATION XTABLES + NFTABLES
#=====================================================

RUN apk --no-cache add iptables ebtables nftables

#=====================================================
# INSTALLATION APPLICATIFS
#=====================================================

RUN apk --no-cache add openssh-server openssh-client && \
    ssh-keygen -A && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    (echo "$PASS"; echo "$PASS") | passwd

RUN apk --no-cache add nfs-utils

COPY conf /

EXPOSE 22
ENTRYPOINT ["/init"]

