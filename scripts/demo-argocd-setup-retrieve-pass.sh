# Retrieve the initial admin password for Argo CD
echo "##################################"
echo "Retrieve the initial admin password for Argo CD"
echo "kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath=\"{.data.password}\" | base64 -d; echo"
echo "##################################"
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
sleep 6
clear