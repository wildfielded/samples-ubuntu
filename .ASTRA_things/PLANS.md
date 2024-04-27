# Заметки и планы по тестам установки системного и прикладного ПО в Astra Linux #

Может оказаться полезным для автоматизации с помощью **Ansible**.

----

## Содержание ##

1. [Установка](#установка)    
2. [Настройка сети](#настройка-сети)    
3. [Ввод в MS Domain через astra-sssd-client](#домен-microsoft)    
4. [Рабочие задачи в домене](#рабочие-задачи-в-домене)    
5. [Установка FreeIPA и настройка доверительных отношений с MS AD]()    
6. [Ввод в FreeIPA]()    
7. [Printers]()    

----

## Установка ##

Здесь и далее речь пойдёт о Astra Linux Common Edition (дистрибутив
&laquo;Орёл&raquo;). При выборе устанавливаемого ПО надо добавить установку
SSH-сервера для того, чтобы далее иметь возможность удалённого администрирования
рабочей станции.

:arrow_right: Для экономии времени на настройки, на этапе установки при выборе
устанавливаемого ПО надо добавить установку SSH-сервера (&laquo;Средства удалённого
доступа SSH&raquo;) для того, чтобы далее иметь возможность удалённого
администрирования рабочей станции. Также при установке сразу запретить
&laquo;беспарольное&raquo; `sudo` и сказать системе, что время в BIOS выставлено
местное.

[:arrow_up: Содержание](#содержание)

----

## Настройка сети ##

:arrow_right: Настройки прокси-сервера можно задать в переменных окружения
`HTTPS_PROXY`, `HTTP_PROXY`, `FTP_PROXY` как глобально, так и для отдельного
конкретного пользователя. Глобально переменные окружения задаются в
**`/etc/environment`** или (не работает в данном дистрибутиве) в
**`/etc/environment.d/<any_name>`**:

```text
HTTPS_PROXY="http://proxyuser:password123@192.168.192.168:3128"
HTTP_PROXY="http://proxyuser:password123@192.168.192.168:3128"
FTP_PROXY="http://proxyuser:password123@192.168.192.168:3128"
```

Для исключений в **`/etc/environment`** добавляется строка со списком адресов:

```text
NO_PROXY="127.0.0.1, localhost, 192.168.0.0/24, wildfielded.site"
```

Если возникает необходимость задания для конкретного пользователя настроек
прокси, отличных от общесистемных, это можно сделать подобным образом в
пользовательском **`~/.bashrc`** или в **`~/.profile`**.

:arrow_right: Для работы **apt** создать файл **`/etc/apt/apt.conf.d/80proxy`**:

```bash
    touch /etc/apt/apt.conf.d/80proxy
```

и в нём прописать:

```text
Acquire::https::Proxy "http://proxyuser:password123@192.168.192.168:3128";
Acquire::http::Proxy "http://proxyuser:password123@192.168.192.168:3128";
Acquire::ftp::Proxy "http://proxyuser:password123@192.168.192.168:3128";
```

:arrow_right: Некоторые программы используют **wget**. Поэтому в файле
**`/etc/wgetrc`** надо задать подобные же параметры:

```text
https_proxy = http://proxyuser:password123@192.168.192.168:3128
http_proxy = http://proxyuser:password123@192.168.192.168:3128
ftp_proxy = http://proxyuser:password123@192.168.192.168:3128
```

[:arrow_up: Содержание](#содержание)

----

## Домен Microsoft ##

:arrow_right: Сначала нормально настроить синхронизацию времени.

```bash
apt purge ntp
apt purge chrony    # не обязательно
apt autoremove
```

В файле **`/etc/systemd/timesyncd.conf`** добавить строки с адресами основного и
резервного NTP-серверов:

```text
NTP=192.168.192.50
FallbackNTP=192.168.192.60
```

И далее

```bash
timedatectl set-ntp 1
timedatectl set-local-rtc 0
systemctl start systemd-timesyncd
```

:arrow_right: Можно заранее поправить **`/etc/hostname`**, указав FQDN
компьютера. Установить

```bash
apt install fly-admin-ad-sssd-client
```

Ввод в домен производится через &laquo;Панель управления&raquo; :arrow_right:
&laquo;Сеть&raquo; :arrow_right: &laquo;Настройка клиента SSSD Fly&raquo;. При
этом компьютер появляется в структуре Active Directory. После перезагрузки можно
входить в систему под доменным логином, предварительно выбрав домен.

Чтобы на данном этапе у администраторов была возможность выполнять команды через
`sudo` и для будущей автоматизации можно создать файл
**`/etc/sudoers.d/astra_admins`**, и в нём прописать:

```text
User_Alias      ASTRA_ADMINS = admin1, admin2, admin3
ASTRA_ADMINS    ALL = (ALL:ALL) ALL
```

где в `ASTRA_ADMINS` перечислить доменные логины, которым нужны админские
полномочия на рабочих станциях Astra Linux.

:arrow_right: Вывод компьютера из домена производится командой:

```bash
astra-ad-sssd-client -U
```

[:arrow_up: Содержание](#содержание)

----

## Рабочие задачи в домене ##

:arrow_right: Для установки сетевого принтеров:

```bash
apt install libnss-mdns
apt install cups-browsed
```

И действовать через &laquo;Панель управления&raquo; :arrow_right:
&laquo;Оборудование&raquo; :arrow_right: &laquo;Принтеры&raquo;. Настройки
печати надо производить от пользователя, который входит в группу `lpadmin`.

:arrow_right: Поддержка токенов для проброса по RDP:

```bash
apt install pcscd
apt install pcsc-tools
```

Токены смотреть утилитой `pcsc_scan`.

:arrow_right: Проброс токена и принтера по RDP:

```bash
apt install freerdp2-x11
# Для Aladdin eToken:
xfreerdp /f /u:Family_NM /v:192.168.192.168 /cert:ignore /printer:EPSON_WF-M5799 /smartcard:eToken
# Для RuToken:
xfreerdp /f /u:Family_NM /v:192.168.192.168 /cert:ignore /printer:EPSON_WF-M5799 /smartcard:Aktiv
```

Можно работать с графическим RDP-клиентом Remmina.

```bash
apt install remmina
```

В нём хорошо пробрасываются токены без дополнительной настройки, но принтеры не
работают автоматически. Надо указывать конкретно в настройках соединения.

:arrow_right: Поддержка SSO (Single Sign On) в браузерах

Можно настроить браузеры, чтобы заходить без дополнительной авторизации на сайты.
В файле **`/etc/sssd/sssd.conf`** изменить параметр:

```text
ad_gpo_access_control = permissive
```

В файле **`/etc/krb5.conf`** в разделе `[libdefaults]` отредактировать/добавить:

```text
[libdefaults]
        default_realm = RKB.LOCAL
        default_ccache_name = FILE:/tmp/krb5cc_%{uid}
```

Для браузеров **Yandex Browser** и **Chromium** создать файлы
**`/etc/opt/yandex/browser/policies/managed/rkb_local.json`** и
**`/etc/chromium/policies/managed/rkb_local.json`**.

[:arrow_up: Содержание](#содержание)

----
