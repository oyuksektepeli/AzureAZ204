$exportRequest = New-AzSqlDatabaseExport `
    -ResourceGroupName $ResourceGroupName `
    -ServerName $ServerName `
    -DatabaseName $DatabaseName `
    -StorageKeytype $StorageKeytype `
    -StorageKey $StorageKey `
    -StorageUri $BacpacUri `
    -AdministratorLogin $creds.UserName `
    -AdministratorLoginPassword $creds.Password
