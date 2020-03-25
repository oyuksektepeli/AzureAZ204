# Create new CDN profile
New-AzCdnProfile `
    -ProfileName ncstoragecdn `
    -Location 'West Europe' `
    -Sku Standard_Akamai `
    -ResourceGroupName nc-storage-rg

# Create a new Azure CDN endpoint within the new
# CDN profile just created
New-AzCdnEndpoint `
    -ProfileName ncstoragecdn `
    -EndpointName ncstoragecdn `
    -ResourceGroupName nc-storage-rg `
    -Location 'West Europe' `
    -OriginName ncstoragecdn `
    -OriginHostName ncstoragecdn.blob.core.windows.net `
    -IsHttpAllowed:$false

# List all profile endpoints
Get-AzCdnProfile | Get-AzCdnEndpoint

# Get existing CDN endpoint
$Endpoint = Get-AzCdnEndpoint `
    -EndpointName ncstoragecdn `
    -ProfileName ncstoragecdn `
    -ResourceGroupName nc-storage-rg

# Set new properties and update
$Endpoint.OriginHostHeader = "ncstoragecdn.blob.core.windows.net"
$Endpoint | Set-AzCdnEndpoint

# First, we remove the endpoint
Remove-AzCdnEndpoint `
    -EndpointName ncstoragecdn `
    -ProfileName ncstoragecdn `
    -ResourceGroupName nc-storage-rg

# Now, remove profile
Remove-AzCdnProfile `
    -ProfileName ncstoragecdn `
    -ResourceGroupName nc-storage-rg