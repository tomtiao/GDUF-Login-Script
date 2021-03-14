### The script needs modification to be functional.
### Remember to change the name of the adapters,
### username and password.

$WirelessDesc = "Intel(R) Wireless-AC 9560 160MHz" # The name of your wireless adapter shown in the device manager
$WiredDesc = "Realtek PCIe GbE Family Controller" # The name of your wired adapter shown in the device manager

$username = "username"
$password = "password"

$WirelessConnectedStatus = (Get-NetAdapter -InterfaceDescription $WirelessDesc).MediaConnectionState

$MacAddr = $CurrentIPv4 = ""

$WillConnectedTo

# Wired
if ($WirelessConnectedStatus -eq "Disconnected") {
    $Adapter = Get-NetAdapter -InterfaceDescription $WiredDesc

    $MacAddr = $Adapter.MacAddress
    $CurrentIPv4 = ($Adapter | Get-NetIPAddress).IPv4Address

    $WillConnectedTo = $WiredDesc
} # Wireless
else {
    $Adapter = Get-NetAdapter -InterfaceDescription $WirelessDesc

    $MacAddr = $Adapter.MacAddress
    $CurrentIPv4 = ($Adapter | Get-NetIPAddress).IPv4Address

    $WillConnectedTo = $WirelessDesc
}

$MacAddr = $MacAddr.ToLower() -replace "-", "%3A"
$CurrentIPv4 = "$CurrentIPv4".Trim()

try {
    $timeout = 2
    $response = Invoke-RestMethod -Uri "http://10.69.69.72/quickauth.do?userid=$username&passwd=$password&wlanuserip=$CurrentIPv4&wlanacname=NFV-BASE1&wlanacIp=&mac=$MacAddr&version=0&portalpageid=1&timestamp=&uuid=&portaltype=" -TimeoutSec $timeout

    $jsonObj = $response

    if ($jsonObj.code -ne "0") {
        Write-Output "Error: $($jsonObj.message). Error code: $($jsonObj.code)"
        Read-Host -Prompt "Press Enter to exit"
    } else { # Restart adapter to avoid 'no connection'
        Restart-NetAdapter -InterfaceDescription $WillConnectedTo
    }
}
catch {
    Write-Output "Error: $_"
    Read-Host -Prompt "Press Enter to exit"
}