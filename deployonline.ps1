Connect-AzAccount

$read = New-Object System.Management.Automation.Host.ChoiceDescription '&Read'
$manage = New-Object System.Management.Automation.Host.ChoiceDescription '&Manage'
$options = [System.Management.Automation.Host.ChoiceDescription[]] ($read, $manage)

$Title = 'Access Type'
$message = 'Please select access type to grant'
$result = $host.ui.PromptForChoice($title, $message, $options, 0)

$single = New-Object System.Management.Automation.Host.ChoiceDescription '&Single'
$multiple = New-Object System.Management.Automation.Host.ChoiceDescription '&Multiple'
$suboptions = [System.Management.Automation.Host.ChoiceDescription[]] ($single, $multiple)

$SubTitle = 'Single or Multiple Subscription Access'
$submessage = 'Please select whether to grant for all subscriptions or just a single one'
$subresult = $host.ui.PromptForChoice($subtitle, $submessage, $suboptions, 1)

if ($subresult -eq 0) {
    Get-AzSubscription | Out-GridView -Title "Select Subscription" -PassThru | Select-AzSubscription
    if ($result -eq 0 ){
            New-AzDeployment -location uksouth -TemplateUri "https://raw.githubusercontent.com/Cisilion-Ltd/Lighthouse/main/CisilionReader.json"
            }
        
        if ($result -eq 1){
                New-AzDeployment -location uksouth -TemplateUri "https://raw.githubusercontent.com/Cisilion-Ltd/Lighthouse/main/CisilionManager.json"
            }
}

if ($subresult -eq 1) {
$subs = Get-AzSubscription
if ($result -eq 0 ){
    foreach ($sub in $subs) {
        Select-AzSubscription -SubscriptionId $sub.Id
        New-AzDeployment -location uksouth -TemplateUri "https://raw.githubusercontent.com/Cisilion-Ltd/Lighthouse/main/CisilionReader.json"
        }
    }
    
    if ($result -eq 1){
        foreach ($sub in $subs) {    
            Select-AzSubscription -SubscriptionId $sub.Id
            New-AzDeployment -location uksouth -TemplateUri "https://raw.githubusercontent.com/Cisilion-Ltd/Lighthouse/main/CisilionManager.json"
        }
    }
}
    
