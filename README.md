# artemis-maven-git-docker
Docker Container for Docker Hub

	docker build --no-cache -t artemis-maven-git-docker .

	docker run -itd -p 80:80 --name artemis-maven-git-docker artemis-maven-git-docker /bin/bash

	docker exec -it artemis-maven-git-docker /bin/bash

	java -version
	
	git -version