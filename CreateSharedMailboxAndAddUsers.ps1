#Create a new shared mailbox
#Begin by defining the name and display name
$NewEmailName = "NewSharedMailBox"
$DISPLAYNAME = "New Shared Mailbox"
New-Mailbox -Shared -Name $NewEmailName -DisplayName $DISPLAYNAME
Start-Sleep -Seconds 10
#This adds an owner to the mailbox calendar
Add-MailboxFolderPermission -Identity NewSharedMailbox@company.onmicrosoft.com:\Calendar -User user1@company.com -AccessRights Owner
Start-Sleep -Seconds 2
#This can be used to add a group or user to be able to see the calendar (reviewer access) if necessary
Add-MailboxFolderPermission -Identity NewSharedMailbox@company.onmicrosoft.com:\Calendar -User CompanyADGroup@company.com -AccessRights Reviewer
#Adding users with full access to the mailbox
Add-MailboxPermission -Identity NewSharedMailbox@company.onmicrosoft.com -User "user1@company.com" -AccessRights FullAccess -InheritanceType All
#Different levels of access can be granted from reviewer to full access. Please consult microsft for a complete list of access levels

If ($NewEmailName -ne $null)
{
$NewEmailName | Sort-Object -Property Size_MB -descending
Write-Host "Mailbox has been Created" -ForegroundColor DarkCyan
}
Else
{
Write-Host "Unable to create mailbox!" -ForegroundColor Red; }

#Check your work
Get-MailboxPermission -Identity "NewSharedMailbox@company.onmicrosoft.com"
Get-MailboxFolderPermission -Identity "NewSharedMailbox@company.onmicrosoft.com:\calendar"

