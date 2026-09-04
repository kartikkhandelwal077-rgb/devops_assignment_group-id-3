# Kubernetes (K8s) Architecture & Commands Cheat Sheet

## 1. Control Plane Components
- **API Server (`kube-apiserver`)**: Exposes the Kubernetes API and serves as the front end for control plane traffic.
- **`etcd`**: Consistent, highly-available key-value store for all cluster data.
- **Scheduler (`kube-scheduler`)**: Selects optimal nodes for newly created Pods.
- **Controller Manager (`kube-controller-manager`)**: Runs controller processes (NodeController, ReplicaSetController).

---

## 2. Worker Node Components
- **`kubelet`**: Agent running on each node ensuring containers are running in Pods.
- **`kube-proxy`**: Network proxy managing network rules on nodes.
- **Container Runtime**: Software responsible for running containers (Containerd, Docker).

---

## 3. Essential `kubectl` Commands
```bash
# Cluster Information
kubectl cluster-info
kubectl get nodes -o wide

# Pod & Deployment Management
kubectl get pods -n devops-prod
kubectl get deployments -n devops-prod
kubectl describe pod <pod-name> -n devops-prod

# Logs & Debugging
kubectl logs -f <pod-name> -n devops-prod
kubectl exec -it <pod-name> -- /bin/sh

# Applying Configurations
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```
