# Asterisk VoIP Demo

## Описание
Демонстрационный проект VoIP системы на базе Asterisk PBX с поддержкой SIP клиентов.

## Возможности
- SIP регистрация пользователей
- Внутренние звонки между пользователями
- IVR меню с голосовыми подсказками
- WebSMS для отправки SMS
- AutoBan для защиты от атак
- ACME для автоматических TLS сертификатов

## Быстрый старт

### 1. Запуск сервера
```bash
docker-compose up -d
```

### 2. Настройка SIP клиентов

#### Пользователь 1 (John Doe):
- Server: `YOUR_SERVER_IP`
- Port: `5060`
- Username: `john.doe`
- Password: `your_password_here`

#### Пользователь 2 (Jane Doe):
- Server: `YOUR_SERVER_IP`
- Port: `5060`
- Username: `jane.doe`
- Password: `your_password_here`

### 3. Номера для звонков
- `100` - John Doe (Answer + hello-world)
- `101` - Jane Doe (Answer + hello-world)
- `500` - IVR меню

## Конфигурация

### Изменение паролей
Отредактируйте файл `src/privatedial/config/pjsip_endpoint.conf`:
```
inbound_auth/password = your_new_password
```

### Изменение IP адреса сервера
Отредактируйте файл `src/privatedial/config/pjsip_endpoint.conf`:
```
remote_hosts = your.server.ip
```

## Порты
- `5060` - SIP (UDP/TCP)
- `5061` - SIP TLS
- `10000-10099` - RTP
- `8080` - WebSMS

## Требования
- Docker
- Docker Compose
- SIP клиент (Zoiper5, MicroSIP, X-Lite)

## Лицензия
MIT License
