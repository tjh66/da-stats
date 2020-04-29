#######################Tim Harris#######################
#######################07/02/2020#######################
##########################V1.0##########################
######################ECC IaaS DC Team##################
########################################################

$ReportDate = (get-date).ToString("dd/MM/yyyy HH:mm")

$a1 = Get-RemoteAccessConnectionStatisticsSummary -ComputerName chesda02.essexcc.local #| ConvertTo-Html -Fragment -Property TotalDAConnections 
$a2 = Get-RemoteAccessConnectionStatisticsSummary -ComputerName chesda03.essexcc.local #| ConvertTo-Html -Fragment -Property TotalDAConnections 
$a3 = Get-RemoteAccessConnectionStatisticsSummary -ComputerName chesda04.essexcc.local #| ConvertTo-Html -Fragment -Property TotalDAConnections 


#######$a3 = Get-RemoteAccessConnectionStatisticsSummary  | ConvertTo-Html -Fragment -Property TotalDAConnections 
#ConvertTo-HTML -head "<style> BODY{color:green; font-size:15px; font-family: Arial, Helvetica, sans-serif;} H5{color:Green;display:inline;} H4{color:Black; display:inline;text-decoration:underline;} </style> <meta http-equiv=""refresh""  content=""5"">" -body "<H4>HARSNS01</H4><H5>$a1</H5><br/> <H4>CHESNS34</H4><H5>$a2</H5><br/> <H4>CHESNS37</H4><H5>$a3</H5> " | Out-File D:\PowershellDAHTMLReport\DAreport.html
#ConvertTo-HTML -head "<style> BODY{color:green; font-size:15px; font-family: Arial, Helvetica, sans-serif;} H5{color:Green;display:inline;} H4{color:Black; display:inline;text-decoration:underline;} </style> <meta http-equiv=""refresh""  content=""5"">" -body "<H4>HARSNS01</H4><H5>$a1</H5><br/> <H4>CHESNS34</H4><H5>$a2</H5><br/> <H4>CHESNS37</H4><H5>$a3</H5> " | Out-File "\\chevmg04\ECCContent\DAreport.html"
#ConvertTo-HTML -head "<style> BODY{color:green; font-size:15px; font-family: Arial, Helvetica, sans-serif;} H5{color:Green;display:inline;} H4{color:Black; display:inline;text-decoration:underline;} </style> <meta http-equiv=""refresh""  content=""5"">" -body "<H4>HARSNS01</H4><H5>$a1</H5><br/> <H4>CHESNS34</H4><H5>$a2</H5><br/> <H4>CHESNS37</H4><H5>$a3</H5> " | Out-File "\\chevmg04\ECCContentV3\DAreport.html"


$sum=[int]$a1.TotalUniqueUsers +[int]$a2.TotalUniqueUsers +[int]$a3.TotalUniqueUsers


# Email

    # HTML format for a table
        # Sets the HTML format for the email body table
        # https://community.spiceworks.com/topic/1571014-bold-one-column-in-a-powershell-script
        
        $BodyStyle = "<style>BODY{font-family: Arial; font-size: 10pt;}"
        $BodyStyle = $BodyStyle + "TABLE{border: 1px solid black; border-collapse: collapse;}"
        $BodyStyle = $BodyStyle + "TH{border: 1px solid black; background: #dddddd; padding: 5px; }"
        $BodyStyle = $BodyStyle + "TD{border: 1px solid black; padding: 5px; }"
        $BodyStyle = $BodyStyle + "</style>"

    # Set the email smtp server to use
    # $PSEmailServer = "Outlook"
    
        $PSEmailServer = "autodiscover.essex.gov.uk"

    # Email Sender

        $MailFromTry = "IS Server Systems Alerts <IsServerSystemAlerts@essex.gov.uk>"    

    # Email Recpients

    $MailRecipientsTry = "Tim Harris <tim.harris@essex.gov.uk>"
    # $MailRecipientsTry = "Paul Hookings <Paul.Hookings@essex.gov.uk>","Is Server Systems Alerts <isServerSystemAlerts@essex.gov.uk"
    
    # $MailRecipientsTry = "Tim Harris <Tim.Harris@essex.gov.uk>","TS Server Systems Alerts <TS.ServerSystemsAlerts@essex.gov.uk>","Alerts and Notifications - Platform and Infrastructure <5d4f48f2.EssexCountyCouncil.onmicrosoft.com@emea.teams.ms>"#, "Kevin Newton <kevin.newton@essex.gov.uk>"

    # Email Subject

    
    $EmailSubjectTry = "This is a Test Direct Access Connections Exceeded Safe Level Run On $ReportDate."
            
    $EmailBodyTry =  "<br><h1 style='color:red;'> Alert DA Connections are currently $sum </h1> <br> <h3 style='color:black;'>Please follow the instructions lined out below</h3> <br> <br> <p>This is a line of text</p> <br> <br>"


if ($sum -le 1000){

###Do nothing

}
else{

write-host "we are over"

send-mailmessage -from $MailFromTry -to $MailRecipientsTry -subject $EmailSubjectTry -body $EmailBodyTry -BodyAsHtml -priority High


}

################
# End of Script#
################