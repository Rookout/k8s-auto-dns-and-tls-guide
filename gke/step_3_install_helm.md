# Install Helm:
We need to install [helm] so we can deploy all of our resources in an easy and reusable way:

`Helm` - _The package manager for Kubernetes, Helm is the best way to find, share, and use software built for Kubernetes._

First thing we need to install helm locally:
```bash
curl -o get_helm.sh https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get
chmod +x get_helm.sh
./get_helm.sh
```
Then we need to install it on the cluster (the tiller part):
```bash
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
helm init --service-account tiller --upgrade
```

Or simply
```bash
make install-helm
```
[Step 4 - Install Demo app](https://github.com/Rookout/k8s-auto-dns-and-tls-guide/blob/master/gke/step_4_hello_world.md)


---
[//]: #URLs

   [helm]: <https://helm.sh/>