docker exec asterisk-ivr pkill tcpdump
docker exec asterisk-ivr rm -f /tmp/*.pcap

# 2. Запускаем дамп для RTP
docker exec -d asterisk-ivr sh -c "tcpdump -i any -s 0 -w /tmp/final-voice-capture.pcap portrange 10000-30000"

# 3. Генерируем RTP трафик
docker exec asterisk-ivr sh -c "timeout 15 rtpsend -f /dev/urandom 127.0.0.1/20000 20002" &

# 4. Тестируем IVR (для логов)
docker exec asterisk-ivr asterisk -rx "channel originate Local/500@my-ivr extension 1@my-ivr" &

# 5. Ждем
sleep 20

# 6. Останавливаем дамп
docker exec asterisk-ivr pkill tcpdump

# 7. Копируем и проверяем
docker cp asterisk-ivr:/tmp/final-voice-capture.pcap ./
ls -la final-voice-capture.pcap