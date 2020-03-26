#deploy with Powershell
New-AzResourceGroupDeployment -ResourceGroupName my-resource-group -TemplateUri https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/101-logic-app-create/azuredeploy.json

#Deploy with AzureCLI
az group deployment create -g my-resource-group --template-uri https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/101-logic-app-create/azuredeploy.json

