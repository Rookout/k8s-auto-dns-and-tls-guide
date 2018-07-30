# Make yourself cluster admin

We need to export the email in order make ourself admins in the cluster (we need it to service account for other component):

```bash
export EMAIL=YOUR_EMAIL
```
```bash
kubectl create clusterrolebinding cluster-admin-binding --clusterrole cluster-admin --user ${EMAIL}
```
Or simply
```bash
make email-admin
```
[Step 3 - Install helm](https://github.com/Rookout/k8s-auto-dns-and-tls-guide/blob/master/gke/step_3_install_helm.md)

