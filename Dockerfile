FROM ubuntu:trusty
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq && apt-get install -y nfs-kernel-server netbase runit inotify-tools -qq
RUN mkdir -p /exports /etc/sv/nfs

ADD nfs.init /etc/sv/nfs/run
ADD nfs.stop /etc/sv/nfs/finish
ADD nfs_setup.sh /usr/local/bin/nfs_setup

VOLUME /mnt

EXPOSE 111/udp 2049/tcp 4000/tcp 4001/tcp

ENTRYPOINT ["/usr/local/bin/nfs_setup"]
