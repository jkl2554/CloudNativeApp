#!/bin/sh
if [ -z "$1" ]; then echo "Need ACR Name ./deploy <ACR Name>"; exit 1; fi
Script_dir="$(dirname $(readlink -f $0))"

cd $Script_dir
export KUBECONFIG="$Script_dir/terraform/kubeconfig"
## default values
acr_name="$1"

echo "### build images ###"
cd ../nginx-front/
az acr build -r $acr_name --image nginx-front:v1.0 --file ./Dockerfile .
cd ../team-blue
az acr build -r $acr_name --image team-blue:v1.0 --file ./Dockerfile .
cd ../team-green
az acr build -r $acr_name --image team-green:v1.0 --file ./Dockerfile .
cd ../team-red
az acr build -r $acr_name --image team-red:v1.0 --file ./Dockerfile .
echo "### deploy yaml files"
cd $Script_dir

kubectl apply -f ./yamls/
