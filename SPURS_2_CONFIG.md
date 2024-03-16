# &laquo;Шпоры&raquo; по практике кофигурирования (настройки) системного и прикладного ПО в Ubuntu #

Может оказаться полезным для автоматизации с помощью Ansible

----

## Содержание ##

1. [Шрифт консоли Ubuntu](#шрифт-консоли-ubuntu)    
2. [Русская локаль Ubuntu](#русская-локаль-ubuntu)    
3. [Преобразование формата SSH-ключа](#преобразование-формата-ssh-ключа)    

----

## Шрифт консоли Ubuntu ##

```bash
    sudo dpkg-reconfigure console-setup
```

----

## Русская локаль Ubuntu ##

На основе [tokmakov.msk.ru/blog/item/466](https://tokmakov.msk.ru/blog/item/466).

В файле `/etc/locale.gen` раскомментировать строку с `ru_RU.UTF-8` и потом дать
команду
```bash
    sudo locale-gen
```
После этого отредактировать файл `/etc/default/locale` касательно
```text
    LANG=ru_RU.UTF-8
```
Можно это сделать не глобально, а на уровне пользователя.

То есть обратить внимание на файлы:
- `/etc/default/keyboard`
- `/etc/default/console-setup`
или аналогично в пользовательском окружении:
- `~/.keyboard`
- `~/.console-setup`

[:arrow_up: Содержание](#содержание)

----

## Преобразование формата SSH-ключа ##

Если возникает необходимость использования SSH-ключа для PuTTY (в формате PPK)
при работе в Ubuntu/Kubuntu:

1. Установка **`putty-tools`**:
```bash
    apt install putty-tools
```

2. &laquo;Выковыривание&raquo; из `newserver.ppk` публичного и приватного ключей:
```bash
    puttygen keyfile.ppk -O private-openssh -o ~/.ssh/newserverkey
    puttygen keyfile.ppk -O public-openssh -o ~/.ssh/newserverkey.pub
    chmod 666 ~/.ssh/newserverkey.pub
    chmod 600 ~/.ssh/newserverkey
```

3. Для простоты соединения можно прописать в `~/bash_aliases`, а если хочется
соединяться простой командой **`ssh newserver`**, то можно сделать
соответствующие добавки в `/etc/hosts`:
```text
192.168.222.110     newserver
```
и в `~/.ssh/config`:
```text
Host    newserver
    Hostname        newserver
    User            admin
    IdentityFile    ~/.ssh/newserverkey
```

[:arrow_up: Содержание](#содержание)

----
