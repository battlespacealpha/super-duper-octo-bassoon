#Pulls the membership list of a dynamic group in exchange
#Must be connected to Exchange-Online

$Groupname = "Target Dynamic Distribution List"
$Recipients = Get-DynamicDistributionGroup $GroupName | ForEach { Get-Recipient -RecipientPreviewFilter $_.RecipientFilter -OrganizationalUnit $_.RecipientContainer }
$ResultCount = $Recipients.Count

#For a csv of the results remove the hash in the following line
$Recipients | Select-Object DisplayName, PrimarySMTPAddress | Sort-Object -Property DisplayName #| Export-Csv -Path "C:\results.csv" -NoTypeInformation

#Counts the list
"Result Count: $ResultCount"
