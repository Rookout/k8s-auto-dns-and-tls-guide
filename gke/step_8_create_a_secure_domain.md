# Create a secure domain (Wrap up):

This is the final step!

After we have everything installed we can create new secure endpoint in a click of the button (or helm chart).


We can install nginx-ingress on our clutster.
```bash
helm install --name cert-manager stable/cert-manager --namespace cert-manager
```

Or simply
```bash
install-nginx
```


* This step install both the ingress itself **AND** the ingress helm recipe - this is thanks to `requirements.yaml`
* The nginx ingress is responsabile for helping us exopse our app to the outside world.

* The external dns will pickup the nginx hosts and create a new dns record.

* The cert-manger (which we will install next) will use the ingress to add ssl certifcate for this record.


---
[//]: #URLs

   [ingress-nginx]: <https://github.com/kubernetes/ingress-nginx>
