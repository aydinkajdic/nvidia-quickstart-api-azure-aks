# Running TAO Toolkit on an AKS

## Introduction

The Code used in this repo will deploy the Nvidia TAO Toolkit on an Azure AKS Cluster.
The original reference can be found here: https://docs.nvidia.com/tao/tao-toolkit/text/tao_toolkit_api/api_setup.html#tao-toolkit-api-aks-setup

## Prerequisites

To get a successful deployment you'll need following:
- Azure account and appropriate permissions
  - The original code is using Service Principal in various occassion. I kept the original approach and therefore you must have a Service Principal ready with the appropriate permissions. 
- GitHub Secrets
  - You may use the code to deploy the components manually however I recommend the automated way with GitHub Action. Following Secrets must be therefore created to make this working:
       1.  AZURE_CLIENT_ID
       2.  AZURE_CLIENT_SECRET
       3.  AZURE_TENANT_ID
       4.  AZURE_SUBSCRIPTION_ID
       5.  AZURE_RESOURCE_GROUP
       6.  AZURE_STORAGE_ACCOUNT
       7.  AZURE_CONTAINER
       8.  NGC_API_KEY
       9.  NGC_EMAIL
       10.  SSH_PUBLIC_KEY

## Getting Started

To get started with the deployment you first need to clone the repo:
- git clone https://github.com/yourusername/nvidia-quickstart-api-azure-aks.git
- cd nvidia-quickstart-api-azure-aks

Update the file terraform/terraform.tfvars with the appropiate values.
- NOTE: The variable Name is used to deploy the unique AKS cluster along with the terraform state file. If you plan to deploy a second instance then please update the name variable with a new unique name. 

Check-in the code to get the workflow action initiated and verify the status on the action.
- NOTE: You can change the deployment yaml file to run the workflow only on a PR and not on every push. 
