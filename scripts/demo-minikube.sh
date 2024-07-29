# Start Minikube with three nodes
echo "##################################"
echo "Start Minikube with three nodes"
echo "minikube start --nodes=3 --profile=demo-profile --driver=docker"
echo "##################################"
minikube start --nodes=3 --profile=demo-profile --driver=docker
sleep 4
clear

# Check Minikube status
echo "##################################"
echo "Check Minikube status"
echo "minikube status --profile=demo-profile"
echo "##################################"
minikube status --profile=demo-profile
sleep 4
clear

# Create the deployment YAML file
echo "##################################"
echo "Create the deployment YAML file"
echo "cat <<EOF > hello-world-deployment.yaml"
echo "apiVersion: apps/v1"
echo "kind: Deployment"
echo "metadata:"
echo "  name: hello-world"
echo "spec:"
echo "  replicas: 3"
echo "  selector:"
echo "    matchLabels:"
echo "      app: hello-world"
echo "  template:"
echo "    metadata:"
echo "      labels:"
echo "        app: hello-world"
echo "    spec:"
echo "      containers:"
echo "      - name: hello-world"
echo "        image: hashicorp/http-echo"
echo "        args:"
echo "          - \"-text=Hello, World!\""
echo "        ports:"
echo "          - containerPort: 5678"
echo "EOF"
echo "##################################"
cat <<EOF > hello-world-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-world
spec:
  replicas: 3
  selector:
    matchLabels:
      app: hello-world
  template:
    metadata:
      labels:
        app: hello-world
    spec:
      containers:
      - name: hello-world
        image: hashicorp/http-echo
        args:
          - "-text=Hello, World!"
        ports:
          - containerPort: 5678
EOF
sleep 4
clear

# Apply the deployment
echo "##################################"
echo "Apply the deployment"
echo "kubectl apply -f hello-world-deployment.yaml"
echo "##################################"
kubectl apply -f hello-world-deployment.yaml
sleep 4
clear

# Check deployments
echo "##################################"
echo "Check deployments"
echo "kubectl get deployments"
echo "##################################"
kubectl get deployments
sleep 4
clear

# Check pods
echo "##################################"
echo "Check pods"
echo "kubectl get pods"
echo "##################################"
kubectl get pods
sleep 4
clear

# Describe the deployment for more details
echo "##################################"
echo "Describe the deployment for more details"
echo "kubectl describe deployment hello-world"
echo "##################################"
kubectl describe deployment hello-world
sleep 4
clear

# Expose the deployment as a service
echo "##################################"
echo "Expose the deployment as a service"
echo "kubectl expose deployment hello-world --type=NodePort --port=5678"
echo "##################################"
kubectl expose deployment hello-world --type=NodePort --port=5678
sleep 4
clear

# Get services
echo "##################################"
echo "Get services"
echo "kubectl get services"
echo "##################################"
kubectl get services
sleep 4
clear

# Get the URL to access the service
echo "##################################"
echo "Get the URL to access the service"
echo "minikube service hello-world --url --profile=demo-profile"
echo "##################################"
minikube service hello-world --url --profile=demo-profile
sleep 4
clear

# Send a request to the exposed service URL
echo "##################################"
echo "Send a request to the exposed service URL"
echo "curl \$(minikube service hello-world --url --profile=demo-profile)"
echo "##################################"
curl $(minikube service hello-world --url --profile=demo-profile)
sleep 4
clear

# Scale the deployment to 5 replicas
echo "##################################"
echo "Scale the deployment to 5 replicas"
echo "kubectl scale deployment hello-world --replicas=5"
echo "##################################"
kubectl scale deployment hello-world --replicas=5
sleep 4
clear

# Check the scaled deployment
echo "##################################"
echo "Check the scaled deployment"
echo "kubectl get deployments"
echo "##################################"
kubectl get deployments
sleep 4
clear

# Check the pods after scaling
echo "##################################"
echo "Check the pods after scaling"
echo "kubectl get pods"
echo "##################################"
kubectl get pods
sleep 4
clear

# Clean up resources

# Delete the service
echo "##################################"
echo "Delete the service"
echo "kubectl delete service hello-world"
echo "##################################"
kubectl delete service hello-world
sleep 4
clear

# Delete the deployment
echo "##################################"
echo "Delete the deployment"
echo "kubectl delete deployment hello-world"
echo "##################################"
kubectl delete deployment hello-world
sleep 4
clear

# Stop Minikube
echo "##################################"
echo "Stop Minikube"
echo "minikube stop --profile=demo-profile"
echo "##################################"
minikube stop --profile=demo-profile
sleep 4
clear

# Delete the Minikube profile
echo "##################################"
echo "Delete the Minikube profile"
echo "minikube delete --profile=demo-profile"
echo "##################################"
minikube delete --profile=demo-profile
sleep 4
clear

