# Lighthouse

The purpose of this repository is to provide Cisilion with the necessary access to Manage or Review your Azure Subscriptions. If you experience issues in running the scripts please reach out to your point of contact for assistance.

## Permissions Granted

For billing access, the Billing Administrator and Managed Services Registration assignment Delete roles are delegated to Cisilion when using the "deploybilling.ps1" script.
For read access, the Global Reader role and Managed Services Registration assignment Delete roles are delegated to Cisilion when using the "deployonline.ps1" script and selecting the "read" option.
Selecting the "Manage" option in this script will grant Contributor rights in addition to the above.

## Requirements

An Azure account with Owner rights on the target subscriptions
The AZ PowerShell Modules
PowerShell version 6 or above

## Running the script

After downloading a copy of the script open PowerShell and run. 
You will be prompted whether to provide read or manage access (for deployonline.ps1) first. The next prompt will be whether to provide access to all subscriptions or select subscriptions. For select subscriptions, a window will appear of all visible subscriptions. Hold ctrl and click to select all that are required then click OK. The script will loop through each subscription provided and assign the necessary permissions.
