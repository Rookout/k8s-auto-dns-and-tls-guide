# Install Helm:

Now we are going to add [ingress-nginx], this will enable us to create an nginx to expose our web-app using the ingress resouce.


### What is an Ingress Controller?

Configuring a webserver or loadbalancer is harder than it should be. Most webserver configuration files are very similar. There are some applications that have weird little quirks that tend to throw a wrench in things, but for the most part you can apply the same logic to them and achieve a desired result.

The Ingress resource embodies this idea, and an Ingress controller is meant to handle all the quirks associated with a specific "class" of Ingress.

An Ingress Controller is a daemon, deployed as a Kubernetes Pod, that watches the apiserver's `/ingresses` endpoint for updates to the [Ingress resource](https://kubernetes.io/docs/concepts/services-networking/ingress/). Its job is to satisfy requests for Ingresses.


We can install nginx-ingress on our clutster.
```bash
helm upgrade --install hello-world hello-world --set nginx.enabled=true --set domain=${DOMAIN} -f hello-world/values.yaml
```

Or simply
```bash
install-nginx
```


* This step install both the ingress itself **AND** the ingress helm recipe - this is thanks to `requirements.yaml`
* The nginx ingress is responsabile for helping us exopse our app to the outside world.

* The external dns will pickup the nginx hosts and create a new dns record.

* The cert-manger (which we will install next) will use the ingress to add ssl certifcate for this record.


[Step 7 -Install cert-manager](https://github.com/Rookout/k8s-auto-dns-and-tls-guide/blob/master/gke/step_7_install_cert_manager.md)


---
[//]: #URLs

   [ingress-nginx]: <https://github.com/kubernetes/ingress-nginx>
