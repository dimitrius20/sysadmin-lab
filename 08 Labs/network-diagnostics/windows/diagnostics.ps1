Write-Host "=== Network Diagnostics ===" -ForegroundColor Cyan
Write-Host ""

Write-Host "[1] Active network adapters" -ForegroundColor Yellow

Get-NetAdapter |
    Where-Object Status -eq "Up" |
    Select-Object Name, InterfaceDescription, LinkSpeed |
    Format-Table -AutoSize

Write-Host "[2] IPv4 configuration" -ForegroundColor Yellow

$configs = Get-NetIPConfiguration |
    Where-Object IPv4Address

foreach ($config in $configs) {
    $ip = ($config.IPv4Address | Select-Object -First 1).IPv4Address
    $gateway = ($config.IPv4DefaultGateway | Select-Object -First 1).NextHop
    $dns = ($config.DNSServer.ServerAddresses -join ", ")

    Write-Host "Interface : $($config.InterfaceAlias)"
    Write-Host "IPv4      : $ip"
    Write-Host "Gateway   : $gateway"
    Write-Host "DNS       : $dns"
    Write-Host ""
}

Write-Host "[3] Default gateway test" -ForegroundColor Yellow

$gateway = Get-NetRoute -AddressFamily IPv4 |
    Where-Object {
        $_.DestinationPrefix -eq "0.0.0.0/0" -and
        $_.NextHop -ne "0.0.0.0"
    } |
    Sort-Object RouteMetric |
    Select-Object -First 1 -ExpandProperty NextHop

if ($gateway) {
    Write-Host "Gateway: $gateway"

    Test-Connection -ComputerName $gateway -Count 2 |
        Select-Object Source, Destination, IPV4Address, Bytes, Time
}
else {
    Write-Host "Default gateway not found" -ForegroundColor Red
}

Write-Host ""
Write-Host "[4] Internet connectivity test" -ForegroundColor Yellow

Test-Connection -ComputerName "8.8.8.8" -Count 2 |
    Select-Object Source, Destination, IPV4Address, Bytes, Time

Write-Host ""
Write-Host "[5] DNS resolution test" -ForegroundColor Yellow

Resolve-DnsName "google.com" |
    Where-Object Type -in "A", "AAAA" |
    Select-Object Name, Type, IPAddress

Write-Host ""
Write-Host "=== Diagnostics completed ===" -ForegroundColor Green
