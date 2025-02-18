#!/bin/bash

# Start Minikube
minikube start

# Install kube-green via Helm
helm repo add kube-green https://kube-green.github.io/helm-charts
helm repo update
helm install kube-green kube-green/kube-green --namespace kube-green --create-namespace

echo "Minikube and kube-green setup completed!"
chmod +x minikube-setup.sh
