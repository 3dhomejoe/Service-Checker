# This script will check the listed services in the array below and attempt to start them if they are stopped. If the service is disabled, it won't be able to start it. This script should be ran as often as needed to verify the services are running as expected.
# Replace Service1 and Service2 with the services needed. You can add more to the array as needed.
# Depending on your setup, you many need to set "Set-ExecutionPolicy" on the machine to allow unsigned scripts to run.
# Another option would be to run this script with the following command "Powershell.exe -executionpolicy bypass -Command service_checker.ps1"

$services = @("Service1","Service2")

#Restart services that are stopped.
foreach($service in $services) {
    $VerifyServiceStopped1 = Get-Service $Service1 | Where-Object {$_.status -eq "Stopped"} | select -last 1
    if ($VerifyServiceStopped1) {
        start-service -Name $service
    }  
}