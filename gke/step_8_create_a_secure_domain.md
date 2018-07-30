# Create a secure domain (Wrap up):

This is the final step!

After we have everything installed we can create new secure endpoint in a click of the button (or helm chart).

First let's deploy everything:

```bash
helm upgrade --install hello-world  hello-world --set nginx.enabled=true --set domain=${DOMAIN} --set tls.enabled=true -f hello-world/values.yaml
```

Or simply
```bash
make add-secure-domain
```


Now let's try and understand how things are working:

### The ingress
```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
 name: nginx-ingress
 annotations:
    kubernetes.io/ingress.class: nginx
 labels:
   app: nginx-ingress
spec:
  tls:
  - hosts:
    - hello-world.rookout.com
    secretName: hello-world.rookout.com-com-tls
  rules:
  - host: hello-world.rookout.com
    http:
      paths:
      - backend:
          serviceName: hello-world-service
          servicePort: 80
```

**The ingress is responsible for connecting our app to the outside world.**

The annotations is what help the controller to pick up the ingress (to route traffic to it)

    ```
     annotations:
        kubernetes.io/ingress.class: nginx
    ```

    The external DNS will pick the domain and create a new DNS record:

    ```
      rules:
      - host: hello-world.rookout.com
    ```
    And using the certifcate we also get an ssl for this endpoint:
    ```
      tls:
      - hosts:
        - hello-world.rookout.com
        secretName: hello-world.rookout.com-com-tls
    ```

### The cert
```
apiVersion: certmanager.k8s.io/v1alpha1
kind: Certificate
metadata:
  name: hello-world.rookout.app-com-tls
spec:
  secretName: hello-world.rookout.app-com-tls
  issuerRef:
    name: letsencrypt-prod
    kind: ClusterIssuer
  commonName: hello-world.rookout.app
  dnsNames:
  - hello-world.rookout.app
  acme:
    config:
    - http01:
        ingress: nginx-ingress
      domains:
      - hello-world.rookout.app
```






---
[//]: #URLs

   [ingress-nginx]: <https://github.com/kubernetes/ingress-nginx>
