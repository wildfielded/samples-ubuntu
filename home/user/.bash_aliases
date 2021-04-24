##### I like this
alias ll='ls -laF | more'

##### Access to FreeBSD with default KOI8-R locale
alias bbb='luit -encoding KOI8-R ssh -l admlogin -p 2222 freebsd.bastion.site'

##### Mounting SMB ver.1 resource
alias DISK='sudo mount.cifs //192.168.192.168/ShareDisk /mnt/Share1 -o user=shareuser,vers=1.0'
alias uDISK='sudo umount -v /mnt/Share1'
