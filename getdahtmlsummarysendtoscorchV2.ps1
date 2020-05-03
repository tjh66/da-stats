#######################Tim Harris#######################
#######################03/05/2020#######################
##########################V1.5##########################
######################ECC IaaS DC Team##################
########################################################

$DAServer1 = "CHESDA02.essexcc.local"
$DAServer2 = "CHESDA03.essexcc.local"
$DAServer3 = "CHEVDA08.essexcc.local"
$DAServer4 = "CHESDA05.essexcc.local"
$DAServer5 = "CHESDA06.essexcc.local"
$DAServer6 = "CHEVDA07.essexcc.local"
$DAServer7 = "CHEVDA09.essexcc.local" 
$DAServer8 = "CHEVDA10.essexcc.local" # today





$DA1 = Get-RemoteAccessConnectionStatisticsSummary #-ComputerName $DAServer1
$DA2 = Get-RemoteAccessConnectionStatisticsSummary -ComputerName $DAServer2
$DA3 = Get-RemoteAccessConnectionStatisticsSummary -ComputerName $DAServer3
$DA4 = Get-RemoteAccessConnectionStatisticsSummary -ComputerName $DAServer4
$DA5 = Get-RemoteAccessConnectionStatisticsSummary -ComputerName $DAServer5
$DA6 = Get-RemoteAccessConnectionStatisticsSummary -ComputerName $DAServer6
$DA7 = Get-RemoteAccessConnectionStatisticsSummary -ComputerName $DAServer7
$DA8 = Get-RemoteAccessConnectionStatisticsSummary -ComputerName $DAServer8


$DA1=$DA1 | Select-Object -ExpandProperty TotalDAConnections
$DA2=$DA2 | Select-Object -ExpandProperty TotalDAConnections
$DA3=$DA3 | Select-Object -ExpandProperty TotalDAConnections
$DA4=$DA4 | Select-Object -ExpandProperty TotalDAConnections
$DA5=$DA5 | Select-Object -ExpandProperty TotalDAConnections
$DA6=$DA6 | Select-Object -ExpandProperty TotalDAConnections
$DA7=$DA7 | Select-Object -ExpandProperty TotalDAConnections
$DA8=$DA8 | Select-Object -ExpandProperty TotalDAConnections

$ConnectionTotal=[int]$DA1+[int]$DA2+[int]$DA3+[int]$DA4+[int]$DA5+[int]$DA6+[int]$DA7+[int]$DA8

Import-Module "D:\PowershellDAHTMLReport\OrchestratorServiceModule.psm1"

$ServiceURL = "http://chevmg76:81/Orchestrator2012/Orchestrator.svc/"
$RunbookGUID = "2276d0c7-dd67-4cdc-9009-8d66d14033f1"
$runbook = Get-OrchestratorRunbook -ServiceUrl $ServiceURL -RunbookId $RunbookGUID
$parmGUID = "c726a644-8659-4b33-8e23-aa0d03658354"
$parameters = @{"519b3a9e-f74d-4bf7-91ba-e59812602b15"=$DAServer1;"48b1141f-8340-49aa-8111-49e89f4fabfd"=$DA1;"4d4c516a-590b-44c9-9e97-03c6c289bf8c"=$DAServer2;"24ea7fd6-4125-4e32-adaa-5a9349f0b9f6"=$DA2;"bbccb46a-7a9a-4ae5-bafd-1ed57eb93d2c"=$DAServer3;"027e1bd2-02b3-4a24-8a1b-851d3e841831"=$DA3;"bfa84810-b3c4-4401-9fb1-aac498a201f9"=$DAServer4;"ef0cc937-5975-4d58-806e-0ceeaa7fc9d8"=$DA4;"ad05fb25-b429-4051-915f-a361a01497fc"=$DAServer5;"30c2a346-205d-4af1-b7a2-bc4b56466da6"=$DA5;"ac9f2ecc-2f8d-477b-a7e0-0e2c356b579c"=$DAServer6;"23070827-386d-4ce1-82e0-8d0029bae091"=$DA6;"607dce01-e919-4a0e-b8c5-4e282c08113d"=$DAServer7;"0d8b2855-a867-4227-95c9-65490ab5cec0"=$DA7;"2781644e-a046-4ed8-8199-e6cd35165dc4"=$DAServer8;"1e284c16-6cb2-43e6-8f96-6602bc944555"=$DA8;"aad59e94-0f99-4a1e-9139-5c7d8714c129"=$ConnectionTotal}


Start-OrchestratorRunbook -Runbook $runbook -Parameters $parameters



exit