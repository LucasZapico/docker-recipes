#  Make -B <target> # allway make 

all:  traefik jellyfin portainer audiobookshelf uptimekuma


##
## cloudflare tunnel 
##
##
cloudflare-zero-trust: 
	docker compose --file ~/dev/lib_docker-compose/cloudflare/cloudflare.docker-compose.yml --env-file ~/dev/lib_docker-compose/cloudflare/.env.cloudflare up --build -d

##
## make homarr
## 2024 chose homelab homescreen
##
homarr:
	docker compose --file ~/dev/lib_docker-compose/homarr.docker-compose.yml up --build -d

jellyfin: 
	docker compose --file ~/dev/lib_docker-compose/jellyfin.docker-compose.yml up --build -d
##
## make portainer
##
portainer: 
	docker compose --file ~/dev/lib_docker-compose/portainer.docker-compose.yml up --build -d
##
## make audiobookshelf
##
audiobookshelf:
	docker compose --file ~/dev/lib_docker-compose/audiobookshelf.v1.0.docker-compose.yml up --build -d
##
## traefik
##
traefik:
	docker compose --file ~/dev/lib_docker-compose/traefik/traefik.v1.0.docker-compose.yml --env-file ~/dev/lib_docker-compose/traefik/.env.traefik up --build -d
##
## uptimekuma
##
uptimekuma:
	docker compose --file ~/dev/lib_docker-compose/uptimekuma.docker-compose.yml up --build -d


#########################################################################
## WIP testing 
########################################################################
##
## twentycrm
##
twentycrm:
	docker compose --file ~/dev/lib_docker-compose/twenty/twenty.docker-compose.yml --env-file ~/dev/lib_docker-compose/twenty/.env.production up --build -d
twentycrm_clean:
	docker compose --file ~/dev/lib_docker-compose/twenty/twenty.docker-compose.yml --env-file ~/dev/lib_docker-compose/twenty/.env.production up --build -d
##
## next cloud
##
nextcloud: 
	docker compose --file ~/dev/lib_docker-compose/nextcloud-mastercontainer.docker-compose.yml up  --build -d
##
## pi hole 
##
pihole:
	docker compose --file ~/dev/lib_docker-compose/pi-hole.docker-compose.yml up --build -d
##
## make jellyfin
##
jellyfinv1: 
	docker compose --file ~/dev/lib_docker-compose/jellyfin.v1.0.docker-compose.yml up --build -d


##########
###
whoami:
	docker compose --file ~/dev/lib_docker-compose/whoami.docker-compose.yml up --build -d
