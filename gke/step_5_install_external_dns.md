# Install external dns:

Now we are going to add [external-dns], this will enable us to create new dns endpoint from within the cluster.

_ExternalDNS synchronizes exposed Kubernetes Services and Ingresses with DNS providers._

Before we start we need to export some env vars:

```bash
export DOMAIN=YOUR_DOMAIN
export DOMAIN_NAMESPACE=YOU_DOMAIN_NAMESPACE
```
```bash
example: start.fake-domain.com -> DOMAIN=start.fake-domain.com, DOMAIN_NAMESPACE=fake-domain.com
```

Now we can install external-dns on our clutster.
```bash
helm install infra --name infra --set externalDns.enabled=true --set domainNamespace=${DOMAIN_NAMESPACE} --dep-up
```

Or simply
```bash
make install-external-dns
```


Great - now when we add an ingress with `hosts` in out cluster - external dns will pick it up and create a domain for us.

[Step 6 - Install nginx controller and ingress](https://github.com/Rookout/k8s-auto-dns-and-tls-guide/blob/master/gke/step_6_install_nginx.md)


---
[//]: #URLs

   [external-dns]: <https://github.com/kubernetes-incubator/external-dns>
