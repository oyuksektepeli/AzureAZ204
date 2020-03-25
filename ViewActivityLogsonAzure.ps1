Get-AzLog -ResourceGroup ExampleGroup
Get-AzLog -ResourceGroup ExampleGroup -StartTime 2015-08-28T06:00 -EndTime 2015-09-10T06:00
Get-AzLog -ResourceGroup ExampleGroup -StartTime (Get-Date).AddDays(-14)
Get-AzLog -ResourceGroup ExampleGroup -StartTime (Get-Date).AddDays(-14) | Where-Object OperationName -eq Microsoft.Web/sites/stop/action
Get-AzLog -ResourceGroup deletedgroup -StartTime (Get-Date).AddDays(-14) -Caller onur.yuksektepeli@yuksektek.com
Get-AzLog -ResourceGroup ExampleGroup -Status Failed

((Get-AzLog -Status Failed -ResourceGroup ExampleGroup -DetailedOutput).Properties[1].Content["statusMessage"] | ConvertFrom-Json).error

code message
---- -------
DnsRecordInUse DNS record dns.westus.cloudapp.azure.com is already used by another public IP.

