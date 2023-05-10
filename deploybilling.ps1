Connect-AzAccount

$select = New-Object System.Management.Automation.Host.ChoiceDescription '&Select'
$all = New-Object System.Management.Automation.Host.ChoiceDescription '&All'
$suboptions = [System.Management.Automation.Host.ChoiceDescription[]] ($select, $all)

$SubTitle = 'Select or All Subscription Access'
$submessage = 'Please select whether to grant for all subscriptions or just a single one'
$subresult = $host.ui.PromptForChoice($subtitle, $submessage, $suboptions, 0)

if ($subresult -eq 1) {
    $subs = Get-AzSubscription
}
if ($subresult -eq 0) {
    $subs = Get-AzSubscription | Out-GridView -PassThru -Title "Select Subscriptions to Manage, hold ctrl to select multiple"
}

foreach ($sub in $subs) {
        Select-AzSubscription -SubscriptionId $sub.Id
        New-AzDeployment -location uksouth -TemplateUri "https://raw.githubusercontent.com/Cisilion/Lighthouse/main/CisilionBilling.json"
}
