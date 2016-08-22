#!/bin/bash

set -e

echo "#nfs-server" >/etc/exports
echo "/exports *(fsid=0,rw,sync,no_subtree_check)" >>/etc/exports

for mnt in "${@}"; do
  src=$(echo $mnt | awk -F':' '{ print $1 }')
  mkdir -p "/exports${src}"
  chmod 777 "/exports${src}"
  echo "/exports${src} *(fsid=0,rw,insecure,sync,no_subtree_check)" >> /etc/exports
done

exec runsvdir /etc/sv
