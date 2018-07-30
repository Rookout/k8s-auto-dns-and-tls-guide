# Install cert manager:

Now we are going to add [cert-manager].

_cert-manager is a Kubernetes add-on to automate the management and issuance of TLS certificates from various issuing sources._

_It will ensure certificates are valid and up to date periodically, and attempt to renew certificates at an appropriate time before expiry._


First we need to install the helm recipe:
```bash
helm install --name cert-manager stable/cert-manager --namespace cert-manager
```

Now let's install clusterissuer:

_ClusterIssuers are a resource type similar to [issuers](https://cert-manager.readthedocs.io/en/latest/reference/issuers.html)._

_They are specified in exactly the same way, but they do not belong to a single namespace and can be referenced by Certificate resources from multiple different namespaces._

```bash
helm upgrade infra infra --set externalDns.enabled=true --set certManager.enabled=true --set email=${EMAIL} --set domainNamespace=${DOMAIN_NAMESPACE}
```

Like always you can use the make command instead:
```bash
make install-cert-manager
```


**We now finshed adding all of the infra parts to our cluster - good for us!!**

Now every time we create an ingress with TLS and hosts the external dns will pick it up -> create a dns record ->
then the  cert manger will pick up the certicate ->  and use the nginx to do the challenge!



[Step 8 - Create a secure domain](https://github.com/Rookout/k8s-auto-dns-and-tls-guide/blob/master/gke/step_8_create_a_secure_domain.md)

---
[//]: #URLs

   [cert-manager]: <https://github.com/jetstack/cert-manager>
