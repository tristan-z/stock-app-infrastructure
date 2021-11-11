deploy: deploy-ui deploy-api deploy-db

destroy: destroy-ui destroy-api destroy-db

teardown:
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

destroy-db:
	kubectl delete -f ./k8s/es-sts-deployment.yaml
	kubectl delete -f ./k8s/svc-cluster.yaml
	kubectl delete -f ./k8s/svc-loadbalancer.yaml

deploy-db:
	kubectl apply -f ./k8s/es-sts-deployment.yaml
	kubectl apply -f ./k8s/svc-cluster.yaml
	kubectl apply -f ./k8s/svc-loadbalancer.yaml
setup:
	minikube start

verify:
	kubectl get pods
	kubectl get deployment


