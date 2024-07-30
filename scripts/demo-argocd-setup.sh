# Create a k3d cluster named argo
echo "##################################"
echo "Create a k3d cluster named argo"
echo "k3d cluster create argo"
echo "##################################"
k3d cluster create argo
sleep 6
clear

# Display Kubernetes cluster information
echo "##################################"
echo "Display Kubernetes cluster information"
echo "kubectl cluster-info"
echo "##################################"
kubectl cluster-info
sleep 6
clear

# Get all resources across all namespaces
echo "##################################"
echo "Get all resources across all namespaces"
echo "kubectl get all -A"
echo "##################################"
kubectl get all -A
sleep 6
clear

# Create a namespace named argocd
echo "##################################"
echo "Create a namespace named argocd"
echo "kubectl create namespace argocd"
echo "##################################"
kubectl create namespace argocd
sleep 6
clear

# Install Argo CD in the argocd namespace
echo "##################################"
echo "Install Argo CD in the argocd namespace"
echo "kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml"
echo "##################################"
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
sleep 6
clear

# Get all resources across all namespaces to verify Argo CD installation
echo "##################################"
echo "Get all resources across all namespaces to verify Argo CD installation"
echo "kubectl get all -A"
echo "##################################"
kubectl get all -A
sleep 15
clear

# Port-forward the Argo CD server service to access the web UI
echo "##################################"
echo "Port-forward the Argo CD server service to access the web UI"
echo "kubectl port-forward svc/argocd-server -n argocd 8080:443"
echo "##################################"
kubectl port-forward svc/argocd-server -n argocd 8080:443
sleep 6
clear

