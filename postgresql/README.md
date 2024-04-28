nano /var/lib/postgresql/data/postgresql.conf
listen_addresses = '*'


nano /var/lib/postgresql/data/pg_hba.conf
host    all             all             0.0.0.0/0               md5


docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' pgsql1


psql -h localhost -p 5442 -U pilgrim_stag_user -d pilgrim_stag_db
psql -h 127.0.0.1 -p 5442 -U pilgrim_stag_user -d pilgrim_stag_db
psql -h 172.20.0.3 -p 5442 -U pilgrim_stag_user -d pilgrim_stag_db # with docker inspect ip as mentioned in above block
psql -h 172.21.0.4 -p 5442 -U pilgrim_stag_user -d pilgrim_stag_db # with inside container ip (ifconfig)


docker exec -it pgsql1 psql -h 127.0.0.1 -p 5442 -U pilgrim_stag_user -d pilgrim_stag_db


[//]: # (status          from container          from docker         from host          from vps)
[//]: # (pgsql1          YES                     YES                 YES                NO)
[//]: # (pgsql2          YES                     YES                 YES                NO)


pgsql1 from container   psql -h localhost -U pilgrim_stag_user -d pilgrim_stag_db                                   psql -h 127.0.0.1 -U pilgrim_stag_user -d pilgrim_stag_db
pgsql1 from docker      docker exec -it pgsql1 psql -h localhost -U pilgrim_stag_user -d pilgrim_stag_db            docker exec -it pgsql1 psql -h 127.0.0.1 -U pilgrim_stag_user -d pilgrim_stag_db
pgsql1 from host        psql -h localhost -p 5422 -U pilgrim_stag_user -d pilgrim_stag_db                           psql -h 127.0.0.1 -p 5422 -U pilgrim_stag_user -d pilgrim_stag_db
pgsql1 from vps         psql -h 89.116.111.60 -p 5432 -U pilgrim_stag_user -d pilgrim_stag_db


pgsql2 from container   psql -h localhost -U postgres                                           psql -h 127.0.0.1 -U postgres
pgsql2 from docker      docker exec -it pgsql2 psql -h localhost -U postgres                    docker exec -it pgsql2 psql -h 127.0.0.1 -U postgres
pgsql2 from host        psql -h localhost -p 5442 -U postgres                                   psql -h 127.0.0.1 -p 5442 -U postgres
pgsql2 from vps         psql -h 89.116.111.60 -p 5432 -U postgres


# STAGING POSTGRES
postgresql from container   psql -h localhost -U pilgrim_stag_user -d pilgrim_stag_db                                   psql -h 127.0.0.1 -U pilgrim_stag_user -d pilgrim_stag_db
postgresql from docker      docker exec -it postgresql psql -h localhost -U pilgrim_stag_user -d pilgrim_stag_db        docker exec -it postgresql psql -h 127.0.0.1 -U pilgrim_stag_user -d pilgrim_stag_db
postgresql from host        psql -h localhost -p 5422 -U pilgrim_stag_user -d pilgrim_stag_db                           psql -h 127.0.0.1 -p 5422 -U pilgrim_stag_user -d pilgrim_stag_db
postgresql from vps         psql -h 89.116.111.60 -p 5432 -U pilgrim_stag_user -d pilgrim_stag_db