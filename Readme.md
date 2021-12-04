# Keycloak DKF

## Postgresql

To restore from `backup/backup.sql` dump:

```bash
# step1: start postgresql in daemon mode
docker-compose up -d postgresql

# step2: get running container id
docker container ls
# it returns e.g. 072117bf1711 for keycloak-postgresql

# step3: reach the running container's terminal
docker exec -it 072117bf1711 bash

# step4: restore db from backup from the container's terminal
psql -U postgres bitnami_keycloak < /bitnami/postgresql/backup/backup.sql

# step5: exit the container's terminal
exit
```

If you are running into problems you may wish to wipe the database volume from the Docker volumes. After that, follow the steps above. 

## Keycloak

```bash
# To run keycloak in daemon mode
docker-compose up -d keycloak
```