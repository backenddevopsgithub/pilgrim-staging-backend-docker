# Pilgrim Staging Backend Docker

### STEPS

```
git clone git@github-backenddevopsgithub:backenddevopsgithub/pilgrim-staging-backend-docker.git
```

### MOVE TO CLONED REPO

```
cd pilgrim-staging-backend-docker
```

### DOCKER BUILD

```
docker compose build
```

### DOCKER UP

```
docker compose up -d
```

### EXEC COMMAND INSIDE DOCKER

```
docker exec -it laravel bash -c "composer install ; [ ! -f .env ] && cp .env.example .env && echo ".env file copied." || echo ".env file already exists." ; php artisan key:generate ; php artisan cache:clear ; npm install ; "
```




### DOCKER DOWN

```
docker compose down
```

### SEE RUNNING CONTAINERS

```
docker ps
```

### SEE ALL CONTAINERS

```
docker ps -a
```

## NOTE

#### if you want to change project folder name like api or laravel make sure to make relevant changes in Dockerfile and in docker-compose.yml file as well
