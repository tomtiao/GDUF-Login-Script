$request = @{
    login="%E4%B8%8B%E7%BA%BF"
}

try
{
    $Response = (Invoke-WebRequest -Uri "http://10.69.69.75/cgi-bin/wlogout.cgi" -Method Post `
        -Body $request -ContentType "application/x-www-form-urlencoded")
}
catch
{
    Write-Output $_.Exception.Response.StatusCode.value__
    Format-Table $Response.Headers
    Read-Host -Prompt "Press Enter to exit"
}