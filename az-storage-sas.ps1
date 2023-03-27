
# Set variables for the storage account, container name and file to copy
$storageAccountName = "" # storage account name
$containerName = "" # container name
$sasToken = "?sv=2021-12-02&ss=b&srt=co&sp=rwdlaciytfx&se=2023-03-30T22:52:22Z&st=2023-03-24T14:52:22Z&spr=https&sig=djhK%2BMIk4h1zDDMC3oS4KpGTzLCoAqm%2BnyiLeeYXxE0%3D"
$localFilePath = "./file.txt"

# Construct the storage account URI with SAS
$storageUri = "https://$storageAccountName.blob.core.windows.net/$containerName$sasToken" 

function Add-FileToBlobStorage{
    Param(
        [Parameter(Mandatory=$true)]
        [string]
        $file,
        [Parameter(Mandatory=$true)]
        [string]
        $connectionstring
    )
    $HashArguments = @{
        uri = $connectionstring.replace("?","/$($(get-item $file).name)?")
        method = "Put"
        InFile = $file
        headers = @{"x-ms-blob-type" = "BlockBlob"}
    }
    Invoke-RestMethod @HashArguments
}
Add-FileToBlobStorage $localFilePath $storageUri

$response = Invoke-RestMethod -Uri "$storageUri&restype=container&comp=list" -Method Get
echo $response
