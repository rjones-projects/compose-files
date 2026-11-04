# Standalone Portainer deployment (for Linux - remove Sudo for Windows)
sudo docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

# To shell into portainer:
docker cp /usr/bin/busybox portainer:/
docker exec -it portainer /busybox sh

# The docker run above makes a plain portainer_data volume, which portainer.yaml then reuses instead of
# binding ~/docker/portainer/data and without the common mount. Deploy with portainer.yaml instead.

# Shared volumes: stacks include this copy, so re-run after changing volumes.yaml
mkdir -p /home/roland/docker/common
cp volumes.yaml /home/roland/docker/common/volumes.yaml

# Shared volumes - Windows - change drive letter as appropriate, and point the stacks' include: at this path
mkdir D:\docker\common
copy volumes.yaml D:\docker\common\volumes.yaml


# To update portainer (as it cannot update itself - just everything it controls)
docker compose -f portainer.yaml pull
docker-compose -f portainer.yaml up --force-recreate --build -d
docker image prune -f
