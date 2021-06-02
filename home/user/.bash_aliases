##### I like this
alias lll='ls -laF | more'

##### Trivials
alias sr='shutdown -r now'
alais sp='shutdown -P now'

##### Access to FreeBSD with default KOI8-R locale
alias bbb='luit -encoding KOI8-R ssh -l admlogin -p 2222 freebsd.bastion.site'

##### Mounting SMB ver.1 resource
##### (Required: sudo apt install cifs-utils)
alias DISK='sudo mount.cifs //192.168.192.168/ShareDisk /mnt/Share1 -o user=shareuser,vers=1.0'
alias uDISK='sudo umount -v /mnt/Share1'

##### Mounting resource in MS AD infrastructure with usernames like DOMAIN\LoginNM
##### (Required: sudo apt install cifs-utils)
alias diskH='sudo mount.cifs //192.168.192.168/NetDisk$ /mnt/Share2 -o domain=DOMAIN,user=WildED'
alias uH='sudo unmount -v /mnt/Share2'
