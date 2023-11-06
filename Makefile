include .env

docker-build:
	docker build -t ${DOCKER_PROJECT_PATH}:latest .docker/

docker-push:
	docker push ${DOCKER_PROJECT_PATH}:latest

k8s-deploy-app:
	kubectl --kubeconfig=${KUBECONFIG} apply -f .k8s/deployment.yaml
	kubectl --kubeconfig=${KUBECONFIG} apply -f .k8s/hpa.yaml
