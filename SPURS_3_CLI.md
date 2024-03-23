# &laquo;Шпоры&raquo; по практике системного администрирования в командной строке Ubuntu #

Может оказаться полезным для автоматизации с помощью Ansible

----

## Содержание ##

1. [Замена концов Win-строк на UNIX-строки](#замена-в-текстовом-файле-windows-строк-в-unix-строки)    
2. [Генерация SSH-ключа под Windows и Ubuntu](#генерация-ssh-ключа)
3. [Работа с Docker](#работа-с-docker)    

----

## Замена в текстовом файле Windows-строк в UNIX-строки ##

```bash
    sed -i .bak "s/\r$//" file.txt
```

[:arrow_up: Содержание](#содержание)

----

## Генерация SSH-ключа ##

```bash
    ssh-keygen -t [rsa|ecdsa|dsa] -b 4096 -f key_file -C "Comment or mail"
```

[:arrow_up: Содержание](#содержание)

----

## Работа с Docker ##

:arrow_right: Сборка docker-image при наличии `${PROJECT_DIR}/Dockerfile`:
```bash
    cd ${PROJECT_DIR}
    docker build -t project:ver1 .
```

:arrow_right: Запуск контейнера из образа
```bash
    docker run -p 8080:7077/tcp project:ver1
    # Без консоли (detach)
    docker run -d -p 8080:7077/tcp project:ver1
```

:arrow_right: Листинг всех контейнеров
```bash
    docker ps -a
```

:arrow_right: Вход в консоль внутри контейнера
```bash
    docker exec -it dfc37e...
```

:arrow_right: Логи контейнера в реальном времени
```bash
    docker logs -f dc45a2...
```

:arrow_right: Последние логи контейнера
```bash
    docker logs --tail 10 dc45a2...
```

:arrow_right: Перезапуск контейнера
```bash
    docker restart ade6e3...
```

:arrow_right: Остановка контейнера
```bash
    docker stop fd3ce7...
```

:arrow_right: Удаление конкретного образа
```bash
    docker rmi ad45fe...
```

:arrow_right: Удаление конкретного контейнера (после остановки)
```bash
    docker rm fd3ce7...
```

:arrow_right: Очистка системы от неиспользуемых образов и контейнеров
```bash
    docker system prune -f
```

[:arrow_up: Содержание](#содержание)

----
