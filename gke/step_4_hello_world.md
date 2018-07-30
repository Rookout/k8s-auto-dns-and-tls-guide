# Install demo app:

Ok great now that we have helm install - let's use it to install our demo app

We will deploy a very simple hello-world service listening on port 80.


To install
```bash
helm install hello-world --name hello-world --dep-up -f hello-world/values.yaml
```

Or simply
```bash
make install-hello-world
```


You can now use `kubectl get pods` to see the pod is up and runing.

You can also use `kubectl port-forward POD_NAME 8080:80` to check everything is working

[Step 5 - Install external dns](https://github.com/Rookout/k8s-auto-dns-and-tls-guide/blob/master/gke/step_5_install_external_dns.md)


---
[//]: #URLs

   [helm]: <https://helm.sh/>