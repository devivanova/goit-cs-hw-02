websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
    "https://www.udemy.com"
)

log_file="website_status.log"

echo "Попытка создать файл логов: $log_file"
if ! > "$log_file"; then
    echo "Ошибка: не удалось создать лог-файл по пути $log_file. Проверьте доступ и права!"
    exit 1
fi

echo "Начало проверки вебсайтов..." 

for site in "${websites[@]}"; do
    status_code=$(curl -s -o /dev/null -w "%{http_code}" -L "$site")
    
    if [ "$status_code" -eq 200 ]; then
        echo "$site is UP" | tee -a "$log_file"
    else
        echo "$site is DOWN (Status code: $status_code)" | tee -a "$log_file"
    fi
done

echo "Проверка завершена. Результаты записаны в файл $log_file"
