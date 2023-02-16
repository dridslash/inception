
all : up

up :
	@docker-compose -f ./docker-compose.yml up --build

down: 
	@docker-compose down -v --rmi all

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

status:
	@docker-compose ps

.PHONNY: up down stop start clean fclean status