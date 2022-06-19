# wget https://github.com/tkuchiki/alp/releases/download/v1.0.9/alp_linux_amd64.zip
# unzip alp_linux_amd64.zip

LOG_FILE=logs/access-$(date "+%H:%M:%S").log

cp /var/log/nginx/access.log $LOG_FILE
cat $LOG_FILE | ./alp ltsv -r --sort=sum -m "/api/condition/*,/api/isu/*"
