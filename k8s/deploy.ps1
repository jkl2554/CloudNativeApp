param(
     [Parameter(Mandatory = $true)]
     [string]$acr_name
)
$Script_dir=Split-Path $Script:MyInvocation.MyCommand.Path
Set-Location -Path $Script_dir
$env:KUBECOFIG="$Script_dir/terraform/kubeconfig"
## default values

Write-Output "### build images ###"
Set-Location -Path ../nginx-front/
az acr build -r $acr_name --image nginx-front:v1.0 --file ./Dockerfile .
Set-Location -Path ../team-blue
az acr build -r $acr_name --image team-blue:v1.0 --file ./Dockerfile .
Set-Location -Path ../team-green
az acr build -r $acr_name --image team-green:v1.0 --file ./Dockerfile .
Set-Location -Path ../team-red
az acr build -r $acr_name --image team-red:v1.0 --file ./Dockerfile .

Write-Output "### deploy yaml files"
Set-Location -Path $Script_dir
kubectl apply -f ./yamls/