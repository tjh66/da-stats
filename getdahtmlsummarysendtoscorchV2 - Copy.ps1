#######################Tim Harris#######################
#######################04/03/2014#######################
##########################V1.0##########################
######################ECC IaaS DC Team##################
########################################################

$DAServer1 = "CHESDA02.essexcc.local"
$DAServer2 = "CHESDA03.essexcc.local"
$DAServer3 = "CHESDA04.essexcc.local"
$DAServer4 = "CHESDA05.essexcc.local"

$DA1 = Get-RemoteAccessConnectionStatisticsSummary #-ComputerName $DAServer1
$DA2 = Get-RemoteAccessConnectionStatisticsSummary -ComputerName $DAServer2
$DA3 = Get-RemoteAccessConnectionStatisticsSummary -ComputerName $DAServer3
$DA4 = Get-RemoteAccessConnectionStatisticsSummary -ComputerName $DAServer4

$DA1=$DA1 | Select-Object -ExpandProperty TotalDAConnections
$DA2=$DA2 | Select-Object -ExpandProperty TotalDAConnections
$DA3=$DA3 | Select-Object -ExpandProperty TotalDAConnections
$DA4=$DA4 | Select-Object -ExpandProperty TotalDAConnections

Import-Module "D:\PowershellDAHTMLReport\OrchestratorServiceModule.psm1"

$ServiceURL = "http://chevmg76:81/Orchestrator2012/Orchestrator.svc/"
$RunbookGUID = "2276d0c7-dd67-4cdc-9009-8d66d14033f1"
$runbook = Get-OrchestratorRunbook -ServiceUrl $ServiceURL -RunbookId $RunbookGUID
$parmGUID = "c726a644-8659-4b33-8e23-aa0d03658354"
$parameters = @{"519b3a9e-f74d-4bf7-91ba-e59812602b15"=$DAServer1;"48b1141f-8340-49aa-8111-49e89f4fabfd"=$DA1;"4d4c516a-590b-44c9-9e97-03c6c289bf8c"=$DAServer2;"24ea7fd6-4125-4e32-adaa-5a9349f0b9f6"=$DA2;"bbccb46a-7a9a-4ae5-bafd-1ed57eb93d2c"=$DAServer3;"027e1bd2-02b3-4a24-8a1b-851d3e841831"=$DA3;"bfa84810-b3c4-4401-9fb1-aac498a201f9"=$DAServer4;"ef0cc937-5975-4d58-806e-0ceeaa7fc9d8"=$DA4}


Start-OrchestratorRunbook -Runbook $runbook -Parameters $parameters



exit



