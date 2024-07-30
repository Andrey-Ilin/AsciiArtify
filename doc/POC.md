# Argo CD Installation and Setup on k3d

This guide will walk you through the steps to create a k3d cluster, install Argo CD, and access its web UI. Follow the steps below to set up your environment.

## Steps

1. **Create a k3d cluster named argo**

    Use the following command to create a new k3d cluster named `argo`. This will set up a lightweight Kubernetes cluster using Docker containers.

    ```bash
    k3d cluster create argo
    ```

2. **Display Kubernetes cluster information**

    Once the cluster is created, you can check the cluster information to ensure that it is running correctly. This command provides details about the cluster's endpoints and Kubernetes components.

    ```bash
    kubectl cluster-info
    ```

3. **Get all resources across all namespaces**

    To get an overview of all the resources running in your cluster, use the following command. This will list all pods, services, deployments, and other resources across all namespaces.

    ```bash
    kubectl get all -A
    ```

4. **Create a namespace named argocd**

    Argo CD requires a dedicated namespace to run its components. Create a namespace named `argocd` using the command below.

    ```bash
    kubectl create namespace argocd
    ```

5. **Install Argo CD in the argocd namespace**

    Install Argo CD by applying the official Argo CD manifest file. This will deploy all the necessary components of Argo CD into the `argocd` namespace.

    ```bash
    kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
    ```

6. **Get all resources across all namespaces to verify Argo CD installation**

    After installing Argo CD, verify that all its components are running correctly by listing all resources again. This ensures that the installation was successful and that all components are up and running.

    ```bash
    kubectl get all -A
    ```

7. **Port-forward the Argo CD server service to access the web UI**

    To access the Argo CD web UI, you need to port-forward the Argo CD server service to your local machine. This command forwards port 8080 on your local machine to port 443 on the Argo CD server service.

    ```bash
    kubectl port-forward svc/argocd-server -n argocd 8080:443
    ```

8. **Retrieve the initial admin password for Argo CD**

    To log in to the Argo CD web UI, you need the initial admin password. Retrieve it using the following command, which extracts the password from the Argo CD secret and decodes it.

    ```bash
    kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
    ```

## Accessing Argo CD

Open your browser and navigate to (make sure you are using https): 
```
https://localhost:8080
```

## Video Demonstration

![Image](../.data/demo-argocd-setup.gif)

![Image](../.data/demo-argocd-setup-retrieve-pass.gif)

![Image](../.data/argocd-ui-test.gif)