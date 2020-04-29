#######################Tim Harris#######################
#######################04/03/2014#######################
##########################V1.0##########################
######################ECC IaaS DC Team##################
########################################################




$a1 = Get-RemoteAccessConnectionStatisticsSummary -ComputerName harsns01.essexcc.local | ConvertTo-Html -Fragment -Property TotalDAConnections 
$a2 = Get-RemoteAccessConnectionStatisticsSummary -ComputerName chesns34.essexcc.local | ConvertTo-Html -Fragment -Property TotalDAConnections 
$a3 = Get-RemoteAccessConnectionStatisticsSummary  | ConvertTo-Html -Fragment -Property TotalDAConnections 
ConvertTo-HTML -head "<style> BODY{color:green; font-size:15px; font-family: Arial, Helvetica, sans-serif;} H5{color:Green;display:inline;} H4{color:Black; display:inline;text-decoration:underline;} </style> <meta http-equiv=""refresh""  content=""5"">" -body "<H4>HARSNS01</H4><H5>$a1</H5><br/> <H4>CHESNS34</H4><H5>$a2</H5><br/> <H4>CHESNS37</H4><H5>$a3</H5> " | Out-File D:\PowershellDAHTMLReport\DAreport.html
ConvertTo-HTML -head "<style> BODY{color:green; font-size:15px; font-family: Arial, Helvetica, sans-serif;} H5{color:Green;display:inline;} H4{color:Black; display:inline;text-decoration:underline;} </style> <meta http-equiv=""refresh""  content=""5"">" -body "<H4>HARSNS01</H4><H5>$a1</H5><br/> <H4>CHESNS34</H4><H5>$a2</H5><br/> <H4>CHESNS37</H4><H5>$a3</H5> " | Out-File "\\chevmg04\ECCContent\DAreport.html"
ConvertTo-HTML -head "<style> BODY{color:green; font-size:15px; font-family: Arial, Helvetica, sans-serif;} H5{color:Green;display:inline;} H4{color:Black; display:inline;text-decoration:underline;} </style> <meta http-equiv=""refresh""  content=""5"">" -body "<H4>HARSNS01</H4><H5>$a1</H5><br/> <H4>CHESNS34</H4><H5>$a2</H5><br/> <H4>CHESNS37</H4><H5>$a3</H5> " | Out-File "\\chevmg04\ECCContentV3\DAreport.html"
exit



