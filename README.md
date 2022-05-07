# Cloud Native App Demo
## 요구사항
- [terraform](https://www.terraform.io/downloads) terraform 
- [azure CLI](https://docs.microsoft.com/ko-kr/cli/azure/install-azure-cli) 2.36.0 버전
- [kubectl](https://kubernetes.io/ko/docs/tasks/tools/)
## 1. Deploy Azure Resources by terraform
Dir: `./k8s/terraform`
```s
## Set Azure CLI
az login
az account set -s <Subscription ID>
## Set Variables
echo 'acr_name = "<Unique ACR Name>"' > variables.auto.tfvars

## Deploy by Terraform
terraform init
terraform apply
```
## 2. Deploy Application
Dir: `./k8s/yamls`
- Change File:`nginx-front.yaml`
```s
...
15 containers:
16      - name: nginx-front
17        image: <Your ACR Name>.azurecr.io/nginx-front:v1.0
...
```
- Change File:`team-blue.yaml`
```s
...
15 containers:
16      - name: team-blue
17        image: <Your ACR Name>.azurecr.io/nginx-front:v1.0
...
```
- Change File:`team-green.yaml`
```s
...
15 containers:
16      - name: team-green
17        image: <Your ACR Name>.azurecr.io/nginx-front:v1.0
...
```
- Change File:`team-red.yaml`
```s
...
15 containers:
16      - name: team-red
17        image: <Your ACR Name>.azurecr.io/nginx-front:v1.0
...
```

Dir: `./k8s`
- in linux
```s
./deploy.sh
```
- in windows
```s
./deploy.ps1
```
## 3. App Check
Dir: `./k8s`
- in linux
```s
export KUBECONFIG="$(pwd)/terraform/kubeconfig"
```
- in windows
```s
$env:KUBECONFIG="$(pwd)/terraform/kubeconfig"
```
- 쿠버네티스 배포 확인
```s
## pod확인
kubectl get po
##servic IP 확인
kubectl get svc nginx-front
```
- 출력된 서비스 IP로 접속 가능
- Deployment 삭제 및 재 배포를 통해 앱 테스트 가능
```s
## green 배포 삭제
kubectl delete deploy green-deployment
```

## 4. 리소스 정리
Dir: `./k8s/terraform`
```s
terraform destroy
```