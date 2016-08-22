Docker NFS Server
================

Usage
----
```bash
docker run -d --name nfs --privileged \
  -v /dev:/dev -v /lib/modules:/lib/modules \
  -v /sbin/modprobe:/sbin/modprobe \
  vincent99/nfs-server \
  /path/to/share /path/to/share2 /path/to/shareN
```
