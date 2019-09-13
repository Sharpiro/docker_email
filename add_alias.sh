if [ -s $1 ]; then
    echo must provide alias as argument
    exit 1
fi

echo adding alias $1
docker exec email-container /bin/bash -c "echo $1: root >> /etc/aliases && newaliases"