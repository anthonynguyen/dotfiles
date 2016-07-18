function docker_delete
	docker rm -f (docker ps -a -q)
	docker rmi (docker images -q)
end
