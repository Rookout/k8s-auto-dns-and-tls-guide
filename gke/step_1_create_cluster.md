
# Create the K8S cluster
First thing we need is to create a cluster (skip this step if you already have a cluster):
```
gcloud container clusters create k8s-aut-dns-and-tls-guide --num-nodes=2 --scopes https://www.googleapis.com/auth/ndev.clouddns.readwrite
```
Or simply
```
make cluster
```

**Make sure you have --scopes https://www.googleapis.com/auth/ndev.clouddns.readwrite**

[Step 2 - Make your self cluster admin](https://github.com/Rookout/k8s-auto-dns-and-tls-guide/blob/master/gke/step_2_cluster_admin.md)

