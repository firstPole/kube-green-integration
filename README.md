# Kubernetes Power Efficiency with Kube-Green

This repository demonstrates the integration of **kube-green** into a production-ready Kubernetes cluster to optimize energy consumption by dynamically scaling workloads. By leveraging **kube-green**, organizations can significantly reduce the carbon footprint of their infrastructure without compromising the performance of mission-critical applications.

## Overview

As cloud environments grow in scale, energy efficiency becomes a key factor in reducing operational costs and carbon emissions. **Kube-green** helps optimize Kubernetes clusters by scaling down nodes when they are underutilized, reducing the power consumption of idle resources.

In this project, we implement **kube-green** to optimize energy consumption across a set of production-level microservices. We demonstrate how to install, configure, and use **kube-green** to make a real-world Kubernetes setup more sustainable.

## Prerequisites

Before setting up **kube-green**, ensure the following tools are installed and properly configured:

- **Minikube**: Used to simulate a local Kubernetes environment.  
  [Minikube Installation Guide](https://minikube.sigs.k8s.io/docs/)
  
- **kubectl**: Command-line tool for interacting with Kubernetes clusters.  
  [kubectl Installation Guide](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
  
- **Helm**: Package manager for Kubernetes to install **kube-green**.  
  [Helm Installation Guide](https://helm.sh/docs/intro/install/)

## Setting Up Kube-Green on Minikube

Follow these steps to deploy **kube-green** in a Kubernetes environment:

### Step 1: Start Minikube Cluster

Ensure Minikube is installed and start the cluster:

```bash
minikube start
This will create a local Kubernetes environment to simulate production-like workloads.

###  Step 2: Install kube-greenn
Add the kube-green Helm repository and install kube-green:
helm repo add kube-green https://kube-green.github.io/helm-charts
helm repo update
helm install kube-green kube-green/kube-green --namespace kube-green --create-namespace
This will deploy kube-green into the kube-green namespace and allow it to start optimizing your cluster's energy usage.

### Step 3: Deploy Production Workloads
In a real-world use case, you would typically deploy a set of services or microservices. For example, a service might consist of multiple pods that are subject to scaling based on usage patterns.

Create a deployment for your application workloads by applying the following Kubernetes resource files. You can adapt the configuration based on the specific workloads you want to optimize.

deployment.yaml: Defines the Kubernetes Deployment for your application. This will manage the pods and their scaling requirements.
service.yaml: Exposes the application internally or externally depending on the service type.
Apply the resources:
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
### Step 4: Monitor Energy Optimization
Kube-green will automatically scale down nodes when they are underutilized, and you can monitor its actions through the kube-green pod logs:
kubectl logs -n kube-green <kube-green-pod-name>
You can also view the status of your nodes and their energy consumption by running the following command:
kubectl get nodes
Kube-green ensures that nodes with minimal workloads are powered down, reducing overall energy consumption.

### Monitoring and Troubleshooting
Kube-green provides logs that can be accessed using kubectl to monitor the optimization process. Here are some useful commands for managing and troubleshooting:

To view logs for kube-green:

kubectl logs -n kube-green <kube-green-pod-name>
To list the current nodes and their utilization:

kubectl get nodes
To check the status of the deployed application:

kubectl get pods
To troubleshoot issues, check the logs for both your application and kube-green to ensure nodes are being scaled down appropriately.

### Key Benefits
- By integrating kube-green into your Kubernetes environment, you can achieve the following:

- Lower Energy Consumption: Automatically scale down idle nodes to reduce power usage, especially during off-peak hours.
- Reduced Carbon Footprint: Help your organization meet sustainability goals by reducing unnecessary energy consumption in cloud-native environments.
- Cost Savings: Optimize the resource utilization of your infrastructure, potentially lowering cloud costs.

## Contribution
Feel free to fork this repository, create issues, and submit pull requests. Contributions that help make Kubernetes clusters more energy-efficient are welcome!

## License
This project is licensed under the MIT License.