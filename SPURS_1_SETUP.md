# &laquo;Шпоры&raquo; по практике установки системного и прикладного ПО в Ubuntu #

Может оказаться полезным для автоматизации с помощью Ansible

----

## Содержание ##

1. [Пакеты после установки Out-of-Box](#out-of-box-пакеты)    
2. [Установка FastAPI](#установка-fastapi)    
3. [Установка Docker](#установка-docker)    

----

## Out-of-Box-пакеты ##

Что полезно установить как рабочий минимум
```bash
    # Бесит, что этого нет в Out-of-Box
    apt install traceroute
    # Или посовременнее
    apt install inetutils-traceroute
    # Простейшие сетевые утилиты типа netstat, ifconfig
    apt install net-tools
    # Для привычной работы с Python
    apt install python3-pip
    apt install python3.10-venv
    # Само собой
    apt install lynx
    apt install mc
```

[:arrow_up: Содержание](#содержание)

----

## Установка FastAPI ##

```bash
    pip install "fastapi[all]"
```
Что должно быть эквивалентно:
```bash
    pip install fastapi
    pip install "uvicorn[standard]"
```

[:arrow_up: Содержание](#содержание)

----

## Установка Docker ##

Каноническая установка docker и docker-compose (под **`sudo -i`**) в
соответствии с официальной документацией Ubuntu:

1. :arrow_right: Сначала обычное обновление базы ПО в подключенных репозиториях
```bash
    apt update
```
После этого можно и обновить ПО (всё или избранное через **`apt upgrade`**)

2. :arrow_right: Проверить наличие пакетов через **`apt search`**. Обычно они
уже есть в стандартной установке, но при отсутствии установить:
```bash
    apt install ca-certificates
    apt install curl
    apt install gnupg
    apt install software-properties-common
```

3. :arrow_right: Скачать GPG-ключ репозитория Docker в директорию для `keyrings`:
```bash
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

4. :arrow_right: Создать файл `/etc/apt/sources.list.d/docker.list`, в котором
должна быть строка:
```text
    deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu jammy stable
```

5. :arrow_right: Ещё раз обновить базу ПО в подключенных репозиториях
```bash
    apt update
```

6. :arrow_right: Проверить на всякий случай, что установка необходимых пакетов
будет из репозитория Docker:
```bash
    apt-cache policy docker-ce
```

7. :arrow_right: Собственно установка необходимых пакетов:
```bash
    apt install docker-ce
    apt install docker-ce-cli
    apt install containerd.io
    apt install docker-buildx-plugin
    apt install docker-compose-plugin
```

8. :arrow_right: В файле `/etc/group` добавить своего пользователя в группу
`docker`, чтобы работать с контейнерами без `sudo`.

9. :arrow_right: Проверка установки сервиса:
```bash
    systemctl status docker.service
```
Или ещё можно запустить тестовый контейнер:
```bash
    docker run hello-world
```

[:arrow_up: Содержание](#содержание)

----
