$resp = Invoke-WebRequest -Uri ""
$resp

$data = ConvertFrom-Json $resp.Content

$data

$data.statusQueryGetUri

$resp = Invoke-WebRequest -Uri $data.statusQueryGetUri
$resp
ConvertFrom-Json $resp.Content