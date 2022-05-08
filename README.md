# Cloud Native App Demo
## 요구사항
- [Terraform](https://www.terraform.io/downloads)
- [Azure CLI](https://docs.microsoft.com/ko-kr/cli/azure/install-azure-cli) 2.27.0 버전 이상
- [kubectl](https://kubernetes.io/ko/docs/tasks/tools/)
## 1. Deploy Azure Resources by terraform
Dir: `./k8s/terraform`
```s
## Set Azure CLI
az login
az account set -s <Subscription ID>
## Set Variables
echo 'acr_name = "<Your ACR Name>"' > variables.auto.tfvars

## Deploy by Terraform
terraform init
terraform apply
```
## 2. Deploy Application
Dir: `./k8s/yamls`
- Update File:`nginx-front.yaml` line 17
```s
...
15 containers:
16      - name: nginx-front
17        image: <Your ACR Name>.azurecr.io/nginx-front:v1.0
...
```
- Update File:`team-blue.yaml` line 17
```s
...
15 containers:
16      - name: team-blue
17        image: <Your ACR Name>.azurecr.io/nginx-front:v1.0
...
```
- Update File:`team-green.yaml` line 17
```s
...
15 containers:
16      - name: team-green
17        image: <Your ACR Name>.azurecr.io/nginx-front:v1.0
...
```
- Update File:`team-red.yaml` line 17
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
./deploy.sh <Your ACR Name>
```
- in windows
```s
./deploy.ps1 <Your ACR Name>
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
## deployment 확인
kubectl get deploy
## pod 확인
kubectl get po
## service 확인
kubectl get svc
```
- 출력된 서비스 IP로 접속 가능
```s
## front end IP
kubectl get svc nginx-front
```
- 특정 Deployment 삭제 후 동작 확인
```s
## green 배포 삭제
kubectl delete deploy green-deployment
```
- 리소스 다시 배포 후 정상 작동 확인  
Dir: `./k8s/`
```s
## kubernetes 리소스 재 배포
kubectl apply -f ./yamls/
```

## 4. 리소스 정리
Dir: `./k8s/terraform`
```s
terraform destroy
```