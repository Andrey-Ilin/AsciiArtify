# Intro: short tools overview

## minikube

### Official documentation

```
https://minikube.sigs.k8s.io/docs/
```

### Short overview

`minikube` quickly sets up a local Kubernetes cluster on macOS, Linux, and Windows.

1. Supports the latest Kubernetes release (+6 previous minor versions)
2. Cross-platform (Linux, macOS, Windows)
3. Deploy as a VM, a container, or on bare-metal
4. Multiple container runtimes (CRI-O, containerd, docker)
5. Direct API endpoint for blazing fast image load and build
6. Advanced features such as LoadBalancer, filesystem mounts, FeatureGates, and network policy
7. Addons for easily installed Kubernetes applications
8. Supports common CI environments

## kind

### Official documentation

```
https://kind.sigs.k8s.io/
```

### Short overview

`kind` is a tool for running local Kubernetes clusters using Docker container “nodes”.
`kind` was primarily designed for testing Kubernetes itself, but may be used for local development or CI.

1. Go packages implementing cluster creation, image build, etc.
2. A command line interface (`kind`) built on these packages.
3. Docker image(s) written to run systemd, Kubernetes, etc.
4. `kubetest` integration also built on these packages (WIP)


## k3d

### Official documentation

```
https://k3d.io/v5.7.2/
```

### Short overview

`k3d` is a lightweight wrapper to run `k3s` (Rancher Lab’s minimal Kubernetes distribution) in docker.
`k3d` makes it very easy to create single- and multi-node `k3s` clusters in docker, e.g. for local development on Kubernetes.




# Tech characteristics comparison table

| Tool        | Supported OS                      | Supported Archs                                | Container Engines                      | UI Dashboard | Monitoring | Managing Kubernetes Cluster |
|-------------|-----------------------------------|------------------------------------------------|----------------------------------------|--------------|------------|-----------------------------|
| minikube    | supports Linux, macOS and Windows | x86_64 (amd64), arm64 (aarch64), arm (limited) | Docker, Podman, CRI-O, container-d     | Yes          | Yes        | Yes                         |
| kind        | supports Linux, macOS and Windows | x86_64 (amd64), arm64 (aarch64), arm (limited) | Docker only                            | No           | No         | Yes                         |
| k3d         | supports Linux, macOS and Windows | x86_64 (amd64), arm64 (aarch64), arm (limited) | Docker only                            | No           | No         | Yes                         |


# Feature Comparison

| Feature               | Minikube | Kind   | k3d   |
|-----------------------|----------|--------|-------|
| Ease of Use           | Easy     | Moderate | Easy  |
| Startup Speed         | Moderate | Fast   | Fast  |
| Stability             | High     | High   | High  |
| Documentation Quality | Excellent | Good   | Good  |
| Community Support     | Strong   | Strong | Growing |
| Setup Complexity      | Moderate | Easy   | Easy  |

# Demo of minikube in action

In this demo, we'll walk through setting up a `minikube` cluster with three nodes and deploying a simple "Hello World" application. We'll expose the application via a service, scale the deployment to five replicas, and demonstrate accessing the application. Finally, we'll clean up the resources and stop the `minikube` cluster

![Image](../.data/demo.gif)

# Minikube vs Kind vs k3d for Local Kubernetes Development

## Minikube

1. Full Kubernetes environment in a VM
2. Rich in features and add-ons
3. Supports multiple platforms and runtimes

## Kind (Kubernetes IN Docker)

1. Runs Kubernetes nodes as Docker containers
2. Fast and lightweight
3. Good for testing and CI/CD

## k3d

1. Runs lightweight k3s in Docker
2. Very fast and resource-efficient
3. Supports multi-node clusters

## Why Choose Minikube

1. Complete Kubernetes setup
2. Isolated environment
3. Strong community support
4. Flexible for various use cases

