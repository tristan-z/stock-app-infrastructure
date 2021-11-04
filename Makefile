deploy: deploy-ui deploy-api

destroy: destroy-ui destroy-api
	minikube stop

destroy-ui:
	kubectl delete -f ./k8s/ui-deployment.yaml
	kubectl delete -f ./k8s/ui-service.yaml

deploy-ui:
	kubectl apply -f ./k8s/ui-deployment.yaml
	kubectl apply -f ./k8s/ui-service.yaml

destroy-api:
	kubectl delete -f ./k8s/api.yaml

deploy-api:
	kubectl apply -f ./k8s/api.yaml
	
setup:
	minikube start
	eval $(minikube docker-env)

verify:
	kubectl get pods
	kubectl get deployment

