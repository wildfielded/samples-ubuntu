##### I like this
alias lll='ls -laF | more'

##### Trivials
alias sr='shutdown -r now'
alais sp='shutdown -P now'

##### Access to FreeBSD with default KOI8-R locale
alias bbb='luit -encoding KOI8-R ssh -l admlogin -p 2222 freebsd.bastion.site'

##### Mounting SMB ver.1 resource
##### (Required: sudo apt install cifs-utils)
alias diskD='sudo mount.cifs //192.168.192.168/ShareDisk /mnt/Share1 -o user=shareuser,vers=1.0'
alias uD='sudo umount -v /mnt/Share1'

##### Mounting resource in MS AD infrastructure with usernames like DOMAIN\UsernameID
##### (Required: sudo apt install cifs-utils)
alias diskH='sudo mount.cifs //172.16.192.168/NetShare$/UserDir /mnt/Share2 -o domain=DOMAIN,user=UsernameID'
alias uH='sudo umount -v /mnt/Share2'
