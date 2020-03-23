New-AzureRmSqlDatabaseCopy -ResourceGroupName "myResourceGroup" `
 -ServerName $sourceserver `
 -DatabaseName "MySampleDatabase" `
 -CopyResourceGroupName "myResourceGroup" `
 -CopyServerName $targetserver `
 -CopyDatabaseName "CopyOfMySampleDatabase"