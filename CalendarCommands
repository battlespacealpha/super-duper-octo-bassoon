#This command checks calendar permissions for a specific user in Exchange and can be used to modify (Set) add or remove permissions
#this command can be used for different folders in Exchange such as Inbox or Contacts

Get-MailboxFolderPermission -Identity "User@company.com:\Calendar"
#Displays permissions on a user's mailbox calendar

Add-MailBoxFolderPermission -Identity "TargetUser@company.com:\Calendar" -User "UserNeedingAccess@company.com" -AccessRights Editor -SharingPermissionFlags Delegate,CanViewPrivateItems
#Adds a user to be a delegate on a calendar with editor permission and the ability to view and edit private calendar items.

#Set-MailBoxFolderPermission -Identity "TargerUser@company.com:\Calendar" -User "UserNeedingAccess@company.com" -AccessRights Editor -SharingPermissionFlags Delegate
#This is a Set command which is used to modify an existing permission. In this example the ability to view private items is removed

#Remove-MailboxFolderPermission -Identity "TargerUser@company.com:\Calendar -User "UserNeedingToBeRemoved@company.com"
#Used to remove a user's permissions entirely
