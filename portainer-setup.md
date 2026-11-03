# Standalone deployment (for Linux - remove Sudo for Windows)
sudo docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

# To shell into portainer:
docker cp /usr/bin/busybox portainer:/
docker exec -it portainer /busybox sh

# Shared volumes: stacks include this copy, so re-run after changing volumes.yaml
mkdir ~/docker/portainer/data/common
cp volumes.yaml ~/docker/portainer/data/common/volumes.yaml

# Shared volumes - Windows - change drive letter as appropriate
mkdir D:\docker\portainer\data\common
copy volumes.yaml D:\docker\portainer\data\common\volumes.yaml


# To update portainer (as it cannot update itself - just everything it controls)
docker compose -f portainer.yaml pull
docker-compose -f portainer.yaml up --force-recreate --build -d
docker image prune -f
