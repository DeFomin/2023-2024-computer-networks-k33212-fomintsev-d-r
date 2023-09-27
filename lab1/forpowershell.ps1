Set-ExecutionPolicy RemoteSigned

function Get-NetworkAdapterInfo {
    param (
        [string]$InterfaceName
    )

    $adapter = Get-NetAdapter | Where-Object { $_.Status -eq "Up" -and $_.Name -eq $InterfaceName }

    $WmiAdapter = Get-WmiObject Win32_NetworkAdapter | Where-Object { $_.Name -eq $InterfaceName }

    if ($adapter -eq $null) {
        Write-Host "Network interface '$InterfaceName' not found."
        return
    }

    Write-Host "Network card: $($adapter.Name)"
    Write-Host "Network card model: $($adapter.InterfaceDescription)"
    Write-Host "Availability of a physical connection (link): $($adapter.LinkSpeed -ne 0)"
    
    if ($adapter.LinkSpeed -ne 0) {
        Write-Host "Adapter speed: $($adapter.LinkSpeed)"

        # доступна ли информация о дуплексном режиме через WMI
        if ($WmiAdapter) {
            $DuplexMode = $WmiAdapter.Duplex
            Write-Host "Duplex Mode: $($DuplexMode)"
        } else {
            Write-Host "Duplex Mode information not available for '$InterfaceName'"
        }
    }
}


$interfaceName = Read-Host "Set name of network interface"

$choice = Read-Host "Selecte setting mode (1: DHCP, 2: Manual)"

if ($choice -eq "1") {
    Write-Host "Selected DHCP mode."
    Set-NetIPInterface -InterfaceAlias $interfaceName -Dhcp Enabled
    Set-DnsClientServerAddress -InterfaceAlias $interfaceName -ResetServerAddresses
} elseif ($choice -eq "2") {
    Write-Host "Selected Manual mode."
    $ipAddress = Read-Host "IP adress"
    $subnetMask = Read-Host "Mask"
    $defaultGateway = Read-Host "Gateway"
    $dnsServers = Read-Host "DNS"

    # Настройка статического IP-адреса
    New-NetIPAddress -InterfaceAlias $interfaceName -IPAddress $ipAddress -PrefixLength 24 | Out-Null

    $routeExists = Get-NetRoute -InterfaceAlias $interfaceName -DestinationPrefix "0.0.0.0/0" -ErrorAction SilentlyContinue

    if ($routeExists -eq $null) {
    	New-NetRoute -InterfaceAlias $interfaceName -DestinationPrefix "0.0.0.0/0" -NextHop $defaultGateway | Out-Null
    }

    Set-DnsClientServerAddress -InterfaceAlias $interfaceName -ServerAddresses $dnsServers -PassThru | Out-Null
} else {
    Write-Host ""
}


Get-NetworkAdapterInfo -InterfaceName $interfaceName

