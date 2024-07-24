# initialize k8s cluster network on master node
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

# configure cluster local info storage.
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# deploy networking component on k8s cluster
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

# ingress controller
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.49.0/deploy/static/provider/baremetal/deploy.yaml


