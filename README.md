# Configuration samples and tips for Ubuntu/Kubuntu
Based on my dummy experience.
1. **Environment** tuning    
[**`/home/ded/.bashrc`**](https://github.com/wildfielded/samples-ubuntu/blob/master/home/ded/.bashrc) - Prompt shortening    
[**`/home/ded/.bash_aliases`**](https://github.com/wildfielded/samples-ubuntu/blob/master/home/ded/.bash_aliases) - Some useful aliases    
[**`/root/.bash_aliases`**](https://github.com/wildfielded/samples-ubuntu/blob/master/root/.bash_aliases) - Same, but feel difference    
[**`/etc/default/console-setup`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/default/console-setup) and    
[**`/etc/systemd/logind.conf`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/systemd/logind.conf) - It used to work with 9 ttys    
----
2. **Networking**    
[**`/etc/netplan/00-installer-config.yaml`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/netplan/00-installer-config.yaml) - Set interfaces through netplan (Ubuntu)    
[**`/etc/netplan/01-network-manager-all.yaml`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/netplan/01-network-manager-all.yaml) - Let NetworkManager working (Kubuntu), "he" is Ironman =)    
----
3. **Proxy** configuration    
[**`/etc/apt/apt.conf.d/proxy`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/apt/apt.conf.d/proxy) - For **apt** only (old way)    
[**`/etc/environment`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/environment) - System-wide proxy configuration sample    
[**`/etc/wgetrc`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/wgetrc) - Possible overrides for **wget**    
----
4. **SSH**    
[**`/home/ded/.ssh/config`**](https://github.com/wildfielded/samples-ubuntu/blob/master/home/ded/.ssh/config) - It works (Old ssh clients and Git accounts)    
----
5. NTP    
[**`/etc/systemd/timesyncd.conf`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/systemd/timesyncd.conf) - Don't forget it with **`timedatectl set-timezone Asia/Moscow`**    
----
6. **Logging**    
[**`/etc/rsyslog.conf`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/rsyslog.conf) - Main config for **rsyslogd**    
[**`/etc/rsyslog.d/bsdsrv`**](https://github.com/wildfielded/samples-ubuntu/blob/master/etc/rsyslog.d/bsdsrv) - Sample for external event sources    
----
7. **Git** matters    
[**`/home/ded/.gitconfig`**](https://github.com/wildfielded/samples-ubuntu/blob/master/home/ded/.gitconfig) - Some tips which may be used both globally or locally    
[**`/home/ded/.git-cded0`**](https://github.com/wildfielded/samples-ubuntu/blob/master/home/ded/.git-cred0) - Format sample for personal access token    
----
8. New **mc** skin    
[**`/usr/share/mc/skins/_ded.ini`**](https://github.com/wildfielded/samples-ubuntu/blob/master/usr/share/mc/skins/_ded.ini)    
I don't know why Midnight Commander has too light and bright blue background color on some screens.
We can create our own skin based on the default skin and make the blue background darker.
----
9. Unsorted    
[**`/home/ded/.config/sublime-text-4/Packages/User/Preferences.sublime-settings`**](https://github.com/wildfielded/samples-ubuntu/blob/master/home/ded/.config/sublime-text-4/Packages/User/Preferences.sublime-settings) - **Sublime-Text** customization    
[**`/home/ded/.netrc`**](https://github.com/wildfielded/samples-ubuntu/blob/master/home/ded/.netrc) - Makes **Heroku** login simple    
----
