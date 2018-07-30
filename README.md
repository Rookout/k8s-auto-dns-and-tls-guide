k8s-auto-dns-and-tls-guide
===
A simple guide for using:
* [helm]
* [cert-manager]
* [ingress-nginx]
* [external-dns]

We are also available on [gitter] if you encounter any problem!

## Guide goal:


This is a **FULL** walkthrough for for configuring your kubernetes cluster for auto tls endpoints.

Adding a new DNS endpoint + SSL certificate in your kubernetes cluster will take only a few seconds.

## Clone the repo before we start:

Clone the repo `git clone https://github.com/rookout/k8s-auto-dns-and-tls-guide`

## Steps:

### GKE

[Step 1 - Create the cluster](https://github.com/Rookout/k8s-auto-dns-and-tls-guide/blob/master/gke/step_1_create_cluster.md)

[Step 2 - Make your self cluster admin](https://github.com/Rookout/k8s-auto-dns-and-tls-guide/blob/master/gke/step_2_cluster_admin.md)

[Step 3 - Install helm](https://github.com/Rookout/k8s-auto-dns-and-tls-guide/blob/master/gke/step_3_install_helm.md)

[Step 4 - Install Demo app](https://github.com/Rookout/k8s-auto-dns-and-tls-guide/blob/master/gke/step_4_hello_world.md)

[Step 5 - Install external dns](https://github.com/Rookout/k8s-auto-dns-and-tls-guide/blob/master/gke/step_5_install_external_dns.md)

[Step 6 - Install nginx controller and ingress](https://github.com/Rookout/k8s-auto-dns-and-tls-guide/blob/master/gke/step_6_install_nginx.md)

[Step 7 - Install cert-manager](https://github.com/Rookout/k8s-auto-dns-and-tls-guide/blob/master/gke/step_7_install_cert_manager.md)

[Step 8 - Create a secure domain](https://github.com/Rookout/k8s-auto-dns-and-tls-guide/blob/master/gke/step_8_create_a_secure_domain.md)



## Troubleshooting

If you encounter any issues whilst using cert-manager, and your issue is not
documented, please [file an issue](https://github.com/Rookout/k8s-auto-dns-and-tls-guide/issues).


---
[//]: #URLs

   [helm]: <https://helm.sh/>
   [gitter]: <https://gitter.im/Rookout/k8s-auto-dns-and-tls-guide>
   [cert-manager]: <https://github.com/jetstack/cert-manager>
   [ingress-nginx]: <https://github.com/kubernetes/ingress-nginx>
   [external-dns]: <https://github.com/kubernetes-incubator/external-dns>
