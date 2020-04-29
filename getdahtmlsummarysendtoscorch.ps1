#######################Tim Harris#######################
#######################04/03/2014#######################
##########################V1.0##########################
######################ECC IaaS DC Team##################
########################################################

$DAServer1 = "CHESDA02.essexcc.local"
$DAServer2 = "CHESDA03.essexcc.local"
$DAServer3 = "CHESDA04.essexcc.local"

$DA1 = Get-RemoteAccessConnectionStatisticsSummary #-ComputerName $DAServer1
$DA2 = Get-RemoteAccessConnectionStatisticsSummary -ComputerName $DAServer2
$DA3 = Get-RemoteAccessConnectionStatisticsSummary -ComputerName $DAServer3

$DA1=$DA1 | Select-Object -ExpandProperty TotalDAConnections
$DA2=$DA2 | Select-Object -ExpandProperty TotalDAConnections
$DA3=$DA3 | Select-Object -ExpandProperty TotalDAConnections

Import-Module "D:\PowershellDAHTMLReport\OrchestratorServiceModule.psm1"

$ServiceURL = "http://chevmg76:81/Orchestrator2012/Orchestrator.svc/"
$RunbookGUID = "5f70f027-4ece-46a1-955c-e9123c4de920"
$runbook = Get-OrchestratorRunbook -ServiceUrl $ServiceURL -RunbookId $RunbookGUID
$parmGUID = "c726a644-8659-4b33-8e23-aa0d03658354"
$parameters = @{"97f3aa5a-e999-47d0-9288-ca80de04c668"=$DAServer1;"c54a1244-cdc1-4fd8-a9b1-6b949620cf81"=$DA1;"f23ec870-3c03-4b5f-b6b1-a84f8f424659"=$DAServer2;"207f140d-25fd-49fc-b0b1-966e85b3ba04"=$DA2;"26cc3163-fec6-4804-b96f-dd9bf30457ce"=$DAServer3;"7e6c923a-36d8-48ac-8f8f-9108f2793c33"=$DA3}
Start-OrchestratorRunbook -Runbook $runbook -Parameters $parameters



exit



