cluster:
	gcloud container clusters create k8s-aut-dns-and-tls-guide --num-nodes=2 --scopes https://www.googleapis.com/auth/ndev.clouddns.readwrite

email-admin:
	kubectl create clusterrolebinding cluster-admin-binding --clusterrole cluster-admin --user ${EMAIL}

install-helm-local:
	curl -o get_helm.sh https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get
	chmod +x get_helm.sh
	./get_helm.sh

install-helm-remote:
	kubectl create serviceaccount --namespace kube-system tiller
	kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
	helm init --service-account tiller --upgrade

install-helm: install-helm-local install-helm-remote

install-hello-world:
	helm install hello-world --name hello-world --dep-up -f hello-world/values.yaml

install-external-dns:
	helm install infra --name infra --set externalDns.enabled=true --set domainNamespace=${DOMAIN_NAMESPACE} --dep-up

install-nginx:
	helm upgrade --install hello-world hello-world --set nginx.enabled=true --set domain=${DOMAIN} -f hello-world/values.yaml

install-cert-manager:
	helm install --name cert-manager stable/cert-manager --namespace cert-manager
	helm upgrade infra infra --set externalDns.enabled=true --set certManager.enabled=true --set email=${EMAIL} --set domainNamespace=${DOMAIN_NAMESPACE}

add-secure-domain:
	helm upgrade --install hello-world  hello-world --set nginx.enabled=true --set domain=${DOMAIN} --set tls.enabled=true -f hello-world/values.yaml
