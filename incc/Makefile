
CMD1=$(shell cd /home/mnaqqad/data && mkdir mariadb && mkdir wordpress)

all : up

up :
@echo $(CMD1)
	@docker-compose -f ./srcs/docker-compose.yml up --build

down:
	@docker-compose  -f ./srcs/docker-compose.yml down

stop:
	@docker stop wordpress mariadb nginx

start:
	@docker start wordpress mariadb nginx

clean :
	@docker rm -f $$(docker ps -a);
	@docker rmi $$(docker images -a);

fclean:
	@docker system prune -a --volumes
	@docker system prune --all
	@docker network prune -f
	@docker volume prune -f
	@rm -rf /home/manqqad/data/mariadb /home/manqqad/data/wordpress

status:
	@docker-compose -f ./srcs/docker-compose.yml ps

.PHONY: up down stop start clean fclean status