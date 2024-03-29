#!/bin/bash

# Check if Docker containers are running, if not, start them
docker_compose_file="/root/pilgrim-staging-backend-docker/docker-compose.yml"
docker_compose_service="laravel mysql redis"

for service in $docker_compose_service; do
    if ! docker-compose -f $docker_compose_file ps -q $service >/dev/null; then
        echo "Container $service is not running. Starting it now..."
        docker-compose -f $docker_compose_file up -d $service
    fi
done

#sudo systemctl enable docker_restart.service
#sudo systemctl start docker_restart.service
#chmod +x docker_restart.sh