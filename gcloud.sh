# Commands to be run in GCloud shell

# Configure gcloud terminal for using kubernetes cluster
gcloud config set project multi-k8s-101
gcloud config set compute/zone us-central1-a
gcloud container clusters get-credentials multi-cluster

# Create secret
kubectl create secret generic pg-password --from-literal=PG_PASSWORD=34987sdkjhfk034@4

# Installing helm
curl -LO https://git.io/get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh

# Create service account (RBAC)
kubectl create serviceaccount --namespace=kube-system tiller

# Do cluster role binding for the service account (RBAC)
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller

# Initialize helm
helm init --service-account tiller --upgrade

# Install nginx ingress service using helm
helm install stable/nginx-ingress --name my-nginx --set rbac.create=true
