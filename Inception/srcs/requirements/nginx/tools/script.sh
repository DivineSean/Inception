#!/bin/bash
ping_wordpress_container()
{
    nc -zv wordpress 9000 > /dev/null
    return $?
}
start_time=$(date +%s) # get the current time in seconds
end_time=$((start_time + 20)) # set the end time to 20 seconds after the start time
while [ $(date +%s) -lt $end_time ]; do # loop until the current time is greater than the end time
    ping_wordpress_container
    if [ $? -eq 0 ]; then
        echo "[========Wordpress IS UP AND RUNNING========]"
        break
    else
        echo "[========WAITING FOR Wordpress TO START...========]"
        sleep 1
    fi
done

if [ $(date +%s) -ge $end_time ]; then # check if the current time is greater than or equal to the end time
    echo "[========Wordpress IS NOT RESPONDING========]"
fi

envsubst < /etc/nginx/config > /etc/nginx/nginx.conf
nginx -g 'daemon off;'