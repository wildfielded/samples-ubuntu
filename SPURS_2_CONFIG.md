# Шпоры по практике кофигурирования (настройки) системного и прикладного ПО ОС Ubuntu #

Может оказаться полезным для автоматизации с помощью Ansible

----

## Содержание ##

[1. Шрифт консоли Ubuntu](#шрифт-консоли-ubuntu)    
[2. Русская локаль Ubuntu](#русская-локаль-ubuntu)    

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
