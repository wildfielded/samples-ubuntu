# Отработанные полезные методы настройки ОС Ubuntu для автоматизации #

----

## Содержание ##

[1. Установка Docker](#установка-docker)

----

## Установка Docker ##

Каноническая установка docker и docker-compose (под **`sudo -i`**) в
соответствии с официальной документацией Ubuntu:

1. Сначала обычное обновление базы ПО в подключенных репозиториях
```bash
apt update
```
После этого можно и обновить ПО (всё или избранное через **`apt upgrade`**)
2. Проверить наличие пакетов через **`apt search`**. Обычно они уже есть в
стандартной установке, но при отсутствии установить:
```bash
apt install ca-certificates
apt install curl
apt install gnupg
apt install software-properties-common
```
3. Скачать GPG-ключ репозитория Docker в директорию для `keyrings`:
```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```
4. Создать файл `/etc/apt/sources.list.d/docker.list`, в котором должна быть строка:
```text
deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download/docker.com/linux/ubuntu jammy stable
```
5. Ещё раз обновить базу ПО в подключенных репозиториях
```bash
apt update
```
6. Проверить на всякий случай, что установка необходимых пакетов будет из
репозитория Docker:
```bash
apt-cache policy docker-ce
```

[:arrow_up: Содержание](#содержание)

----