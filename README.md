# Configuration samples and tips for Ubuntu/Kubuntu
Based on my dummy experience.
1. **Users** and their **Environment** tuning    
[**`/home/ded/.bashrc`**](https://github.com/wildfielded/samples-ubuntu/blob/master/home/ded/.bashrc) - Prompt shortening    
[**`/home/ded/.bash_aliases`**](https://github.com/wildfielded/samples-ubuntu/blob/master/home/ded/.bash_aliases) - Some useful aliases    
[**`/root/.bash_aliases`**](https://github.com/wildfielded/samples-ubuntu/blob/master/root/.bash_aliases) - Same, but feel difference    
[**`/etc/adduser.conf`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/adduser.conf) - Template for creating users with admin (sudo) rights    
[**`/etc/login.defs`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/login.defs) - User policies    
[**`/etc/systemd/logind.conf`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/systemd/logind.conf) - It used to work with 9 ttys    
[**`/etc/default/console-setup`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/default/console-setup) 9 ttys and Russian locale    
[**`/etc/default/keyboard`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/default/keyboard) - Russian locale    
[**`/etc/default/locale`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/default/locale) - Russian locale    
----
2. **Networking**    
[**`/etc/netplan/00-installer-config.yaml`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/netplan/00-installer-config.yaml) - Set interfaces through `netplan` with `networkd` (Ubuntu)    
[**`/etc/netplan/01-network-manager-all.yaml`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/netplan/01-network-manager-all.yaml) - Let `NetworkManager` working (Kubuntu), "he" is Ironman =)    
----
3. **Proxy** configuration    
[**`/etc/apt/apt.conf.d/proxy`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/apt/apt.conf.d/proxy) - For **apt** only (old way)    
[**`/etc/environment`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/environment) - System-wide proxy configuration sample    
[**`/etc/wgetrc`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/wgetrc) - Possible overrides for **wget**    
[**`/etc/profile`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/profile) - The most universal (except of apt) proxy configuration sample via profile-file.    
----
4. **SSH**    
[**`/home/ded/.ssh/config`**](https://github.com/wildfielded/samples-ubuntu/blob/master/home/ded/.ssh/config) - It works (Old ssh clients and Git accounts)    
----
5. **NTP**    
[**`/etc/systemd/timesyncd.conf`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/systemd/timesyncd.conf) - Don't forget it with **`timedatectl set-timezone Asia/Moscow`**    
----
6. **Logging**    
[**`/etc/rsyslog.conf`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/rsyslog.conf) - Main config for **rsyslogd**    
[**`/etc/rsyslog.d/bsdsrv`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/rsyslog.d/bsdsrv) - Sample for external event sources    
[**`/etc/logrotate.conf`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/logrotate.conf) - Defaults for logrotate    
[**`/etc/logrotate.d/rsyslog`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/logrotate.d/rsyslog) - For example    
----
7. **Bind**    
[**`/etc/bind/`**](https://github.com/wildfielded/samples-ubuntu/tree/master/etc/bind) - All the given configs provide the same functionality as in the [**example FreeBSD servers**](https://github.com/wildfielded/samples-freebsd/tree/master/usr/local/named/usr/local/etc/namedb)    
[**`/etc/default/named`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/default/named) - and don't forget to add **`-4`** flag for operating with IPv4 only    
----
8. **Git** matters    
[**`/home/ded/.gitconfig`**](https://github.com/wildfielded/samples-ubuntu/blob/master/home/ded/.gitconfig) - Some tips which may be used both globally or locally    
[**`/home/ded/.git-cded0`**](https://github.com/wildfielded/samples-ubuntu/blob/master/home/ded/.git-cred0) - Format sample for personal access token    
----
9. New **mc** skin    
[**`/usr/share/mc/skins/_ded.ini`**](https://github.com/wildfielded/samples-ubuntu/blob/master/usr/share/mc/skins/_ded.ini)    
I don't know why Midnight Commander has too light and gouged out the default blue background on some screens.
We can create our own skin based on the default skin and make the blue background darker.
----
10. Unplugged    
[**`/home/ded/.config/sublime-text-4/Packages/User/Preferences.sublime-settings`**](https://github.com/wildfielded/samples-ubuntu/blob/master/home/ded/.config/sublime-text-4/Packages/User/Preferences.sublime-settings) - **Sublime-Text** customization    
[**`/home/ded/.netrc`**](https://github.com/wildfielded/samples-ubuntu/blob/master/home/ded/.netrc) - Makes **Heroku** login simple    
----
