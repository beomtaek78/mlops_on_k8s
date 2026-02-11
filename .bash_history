vi /etc/sudoers
apt update && apt install -y git curl wget vim ssh 
apt install -y nfs-kernel-server nfs-common
systemctl disable ufw --now
vi /etc/sudoers
vi /etc/ssh/sshd_config
sysetmctl enable ssh --now
systemctl enable ssh --now
systemctl set-default multi-user.target
passwd root
init 0
vi ~/.ssh/authorized_keys 
ip a
clear
vi /etc/hosts
sudo swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fstab
cat /etc/fstab
vi /etc/fstab
sudo modprobe overlay
sudo modprobe br_netfilter
sudo tee /etc/modules-load.d/k8s.conf <<EOF
overlay
br_netfilter
EOF

sudo tee /etc/sysctl.d/k8s.conf <<EOF
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

sudo sysctl --system
sudo apt update
sudo apt install -y containerd
sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml
vi /etc/containerd/config.toml 
sudo systemctl restart containerd
sudo systemctl enable containerd
containerd --version
sudo apt install -y apt-transport-https ca-certificates curl gpg
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] \
https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
sudo kubeadm init   --apiserver-advertise-address=172.16.8.20   --pod-network-cidr=192.168.0.0/16
sudo apt update
sudo apt install -y conntrack
sudo kubeadm init   --apiserver-advertise-address=172.16.8.20   --pod-network-cidr=192.168.0.0/16
export KUBECONFIG=/etc/kubernetes/admin.conf
echo "export KUBECONFIG=/etc/kubernetes/admin.conf" >> ~/.bashrc
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.2/manifests/calico.yaml
k get no
kubectl get no
vi ~/.bashrc
k get no
source ~/.bashrc
k get no
clear
k get no
mkdir metallb
cd metallb/
curl -O https://raw.githubusercontent.com/metallb/metallb/v0.14.5/config/manifests/metallb-native.yaml
ls
touch ipaddresspool.yaml l2advertisement.yaml
vi ipaddresspool.yaml 
vi l2advertisement.yaml 
k apply -f .
k get ns
ls
k apply if l2advertisement.yaml 
k apply -f l2advertisement.yaml 
k apply -f ipaddresspool.yaml 
k get po -n metallb-system
kubectl create deployment nginx --image=nginx
kubectl expose deployment nginx --type=LoadBalancer --port=80
kubectl get svc nginx
k get deploy,svc 
k delet deploy nginx
k delete deploy nginx
k delete svc nginx
clear
cd
clear
ssh worker1 -l root 'init 0'
ssh worker2 -l root 'init 0'
init 0
mkdir /k8s
chmod 777 /k8s
vi /etc/exports 
clear
systemctl restart nfs-server
ls
mkdir nfs-provisioner
cd nfs-provisioner/
curl https://raw.githubusercontent.com/kubernetes-sigs/nfs-subdir-external-provisioner/master/deploy/rbac.yaml
clear
wget https://raw.githubusercontent.com/kubernetes-sigs/nfs-subdir-external-provisioner/master/deploy/rbac.yaml
ls
touch nfs-provisioner.yaml storageclass.yaml
vi nfs-provisioner.yaml 
vi storageclass.yaml 
ls
k apply -f rbac.yaml 
k apply -f nfs-provisioner.yaml 
k apply -f storageclass.yaml 
kubectl get deployment nfs-client-provisioner -o yaml | grep serviceAccount
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash -s -- 5.2.1
sudo install -o root -g root -m 0755 kustomize /usr/local/bin/kustomize
cd
kustomize version
ssh -l root worker1 'init 0'
ssh -l root worker2 'init 0'
init 0
kustomize version
ls
ls nfs-provisioner/
k get sc
cat nfs-provisioner/nfs-provisioner.yaml 
ls
cd nfs-provisioner/
ls
k apply -f rbac.yaml 
k apply -f nfs-provisioner.yaml 
clear
ip a
git clone https://github.com/kubeflow/manifests.git
cd manifests
# Checkout a recent version that supports 1.31, e.g., v1.9.0 or later
git checkout v1.9.0 
while ! kustomize build example | kubectl apply -f -; do echo "Retrying"; sleep 10; done
k get po -n kubeflow
docker login -u brian24
k get po -n kubeflow
k get po -n kubeflow -w
k get po -n kubeflow 
k describe po minio-7c77bc59b8-tgs7q -n kubeflow
k get po -n kubeflow 
kubectl -n kubeflow edit deployment minio
kubectl -n kubeflow delete pod -l app=minio
k get po -n kubeflow 
k describe po minio-7c77bc59b8-nc54c -n kubeflow
kubectl get deploy minio -n kubeflow -o yaml | grep image
kubectl -n kubeflow edit deployment minio
kubectl -n kubeflow rollout restart deployment minio
k get po -n kubeflow 
k describe po ml-pipeline-9f4fb47b6-pws2v -n kubeflow
k get po -n kubeflow 
k describe po ml-pipeline-ui-85f696b75f-n25vw -n kubeflow
kubectl -n kubeflow edit deployment ml-pipeline-ui
kubectl -n kubeflow rollout restart deployment ml-pipeline-ui
k get po -n kubeflow 
kubectl -n kubeflow edit deployment ml-pipeline-ui
kubectl -n kubeflow rollout restart deployment ml-pipeline-ui
k get po -n kubeflow 
k describe po ml-pipeline-ui-58b696bb77-t6lr8 -n kubeflow
kubectl -n kubeflow edit deployment ml-pipeline-ui
kubectl -n kubeflow rollout restart deployment ml-pipeline-ui
k get po -n kubeflow 
k describe po ml-pipeline-ui-6bdc54ff7f-q9ppt -n kubeflow
kubectl -n kubeflow edit deployment ml-pipeline-ui
kubectl -n kubeflow rollout restart deployment ml-pipeline-ui
k get po -n kubeflow 
k describe po ml-pipeline-ui-5c8bc45d87-787bd -n kubeflow
kubectl -n kubeflow edit deployment ml-pipeline-ui
kubectl -n kubeflow rollout restart deployment ml-pipeline-ui
k get po -n kubeflow 
k get po -n kubeflow | grep pipeline
k describe p -n kubeflow
kubectl -n kubeflow edit deployment ml-pipeline-ui
kubectl -n kubeflow rollout restart deployment ml-pipeline-ui
k get po -n kubeflow 
k describe po ml-pipeline-ui-595f7b6554-bwv2q -n kubeflow
kubectl -n kubeflow edit deployment ml-pipeline-ui
kubectl -n kubeflow rollout restart deployment ml-pipeline-ui
k get po -n kubeflow 
k describe po ml-pipeline-ui-6fb58c8c7f-qblsw -n kubeflow
kubectl -n kubeflow edit deployment ml-pipeline-ui
kubectl -n kubeflow rollout restart deployment ml-pipeline-ui
k get po -n kubeflow 
k get po -n kubeflow | grep pipeline-ui
k describe po ml-pipeline-ui-56d44c46-dn4np -n kubeflow
kubectl -n kubeflow edit deployment ml-pipeline-ui
kubectl -n kubeflow rollout restart deployment ml-pipeline-ui
k get po -n kubeflow | grep pipeline-ui
k describe po ml-pipeline-ui-5c784b8dbb-szdrf -n kubeflow
kubectl edit deployment ml-pipeline-ui -n kubeflow
k get po -n kubeflow | grep pipeline-ui
kubectl -n kubeflow rollout restart deployment ml-pipeline-ui
k get po -n kubeflow | grep pipeline-ui
k describe po ml-pipeline-ui-5d7f4cf9bb-92lzj -n kubeflow
k get po -n kubeflow 
k describe po ml-pipeline-ui-5d7f4cf9bb-92lzj -n kubeflow
kubectl -n kubeflow edit deployment ml-pipeline-ui
kubectl -n kubeflow rollout restart deployment ml-pipeline-ui
k get po -n kubeflow 
k describe po ml-pipeline-ui-66855dc989-klh76 -n kubeflow
kubectl -n kubeflow edit deployment ml-pipeline-ui
kubectl -n kubeflow rollout restart deployment ml-pipeline-ui
k get po -n kubeflow 
k describe po ml-pipeline-ui-6d884d6fd6-mqjrk -n kubeflow
kubectl -n kubeflow edit deployment ml-pipeline-ui
k get po -n kubeflow 
k describe po ml-pipeline-ui-7d8dc9f66f-dn577 -n kubeflow
crictl login ghcr.io
crictl ghcr.io -u
crictl ghcr.io
docker login ghcr.io -u
crictl ghcr.io login
crictl login ghcr.io 
crictl login ghcr.io
VERSION=1.7.7
wget https://github.com/containerd/nerdctl/releases/download/v$VERSION/nerdctl-$VERSION-linux-amd64.tar.gz
tar -C /usr/local/bin -xzf nerdctl-$VERSION-linux-amd64.tar.gz
nerdctl version
nerdctl login ghcr.io
nerdctl pull gcr.io/ml-pipeline/frontend:2.2.0
nerdctl pull gcr.io/ml-pipeline/frontend:2.1.0
nerdctl pull kubeflow/pipelines-ui:2.2.0
nerdctl pull ghcr.io/kubeflow/kfp-ui:2.2.0
nerdctl pull ghcr.io/kubeflow/kfp-ui:2.3.0
nerdctl pull ghcr.io/kubeflow/kfp-ui:2.1.0
nerdctl pull ghcr.io/kubeflow/kfp-ui:2.1.5
nerdctl pull kubeflow/kfp-ui:2.2.0
nerdctl pull ghcr.io/kubeflow/pipelines/frontend:2.2.0
nerdctl pull kfp-ui:2.2.0
nerdctl pull kubeflow/ml-pipeline-ui:2.0.5
cat ~/.docker/config.json 
nerdctl login docker.io
nerdctl login docker
nerdctl login docker.io
docker login -u brian24
k get po -n kubeflow
ssh worker1 'reboot'
ssh worker2 'reboot'
reboot
k get po -n kubeflow
k describe po ml-pipeline-ui-6d884d6fd6-mqjrk -n kubeflow 
nerdctl login ghcr.io
nerdctl pull ghcr.io/kubeflow/pipelines/api-server:v2.3.0
crictl pull ghcr.io/kubeflow/pipelines/api-server:v2.3.0
nerdctl manifest inspect ghcr.io/kubeflow/kfp-api-server:2.3.0
nerdctl pull ghcr.io/kubeflow/kfp-api-server:2.3.0
nerdctl pull ghcr.io/kubeflow/kfp-frontend:2.3.0
nerdctl pull docker.io/kubeflow/kfp-api-server:2.3.0
nerdctl pull docker.io/kubeflow/kfp-frontend:2.3.0
nerdctl login registry-1.docker.io
nerdctl pull docker.io/kubeflow/kfp-api-server:2.3.0
nerdctl pull docker.io/kubeflow/kfp-frontend:2.3.0
nerdctl pull ghcr.io/kubeflow/pipelines/api-server:2.3.0
nerdctl pull ghcr.io/kubeflow/pipelines/frontend:2.3.0
nerdctl pull ghcr.io/kubeflow/pipelines/frontend:2.2.0
nerdctl pull root@master:~# nerdctl pull ghcr.io/kubeflow/pipelines/api-server:2.3.0
nerdctl pull ghcr.io/kubeflow/pipelines/frontend:2.3.0
ghcr.io/kubeflow/pipelines/api-server:2.3.0: resolving      |--------------------------------------|
elapsed: 0.8 s                               total:   0.0 B (0.0 B/s)
INFO[0001] trying next host - response was http.StatusNotFound  host=ghcr.io
FATA[0001] failed to resolve reference "ghcr.io/kubeflow/pipelines/api-server:2.3.0": ghcr.io/kubeflow/pipelines/api-server:2.3.0: not found
ghcr.io/kubeflow/pipelines/frontend:2.3.0: resolving      |--------------------------------------|
elapsed: 0.7 s                             total:   0.0 B (0.0 B/s)
INFO[0000] trying next host - response was http.StatusNotFound  host=ghcr.io
FATA[0000] failed to resolve reference "ghcr.io/kubeflow/pipelines/frontend:2.3.0": ghcr.io/kubeflow/pipelines/frontend:2.3.0: not found
root@master:~#

nerdctl pull ghcr.io/kubeflow/kfp-frontend:2.15.0
k get po -n kubeflow 
k describe po ml-pipeline-ui-6d884d6fd6-mqjrk -n kubeflow
kubectl get deploy ml-pipeline-ui -n kubeflow   -o=jsonpath='{.spec.template.spec.containers[*].image}'
kubectl set image deployment/ml-pipeline-ui   ml-pipeline-ui=ghcr.io/kubeflow/kfp-frontend:2.15.0   -n kubeflow
kubectl rollout status deployment/ml-pipeline-ui -n kubeflow
k get po -n kubeflow 
kubectl get svc istio-ingressgateway -n istio-system
kubectl edit svc istio-ingressgateway -n istio-system
kubectl get svc istio-ingressgateway -n istio-system
cat /etc/exports
ls
cd nfs-provisioner/
ls
cat storageclass.yaml 
cat nfs-provisioner.yaml 
cat https://github.com/cert-manager/cert-manager/releases/download/v1.13.0/cert-manager.yaml
wget https://github.com/cert-manager/cert-manager/releases/download/v1.13.0/cert-manager.yaml
ls
cat cert-manager.yaml 
hisotry
history
cat ~/.docker/config.json 
k get po -n kubeflow
cd
k get no -o wide
ls
cd metallb/
ls
cat metallb-native.yaml 
ls
cd ..
ls
ls -al
cat /etc/exports 
ls
cd nfs-provisioner/
ls
cat storageclass.yaml 
cat rbac.yaml # https://raw.githubusercontent.com/kubernetes-sigs/nfs-subdir-external-provisioner/master/deploy/rbac.yaml
ls
cat nfs-provisioner.yaml 
cd
k get po -n kubeflow
ssh worker1 'init 0'
ssh worker2 'init 0'
init 0
k get po -n kubeflow
k get svc -n kubeflow
k get svc -n istio-system
ssh worker1 'init 0' 
ssh worker2 'init 0' 
df -h
init 0
