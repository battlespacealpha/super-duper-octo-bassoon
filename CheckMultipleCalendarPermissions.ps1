#This is useful in the event that you need to check the permissions of multiple calendars and relys on producing a hash table. 
#This is good for checking many calendars at one time. If addresses are provided use another program such as notepad++ or excel to add :\calendar to each entry.

# Create a hash table to link the email addresses to their calendar paths\folders
$calendars = @{
    "user1@company.com" = "user1@company.com:\Calendar"
    "user2@company.com" = "user2@company.com:\Calendar"
    "user3@company.com" = "user3@company.com:\Calendar"

}

# Lump results into an array
$calendarPermissions = @()

###Cycles through each calendar in the hash table
foreach ($userEmail in $calendars.Keys) {
    $calendarPath = $calendars[$userEmail]

    # Get mailbox folder permissions for each calendar
    $mailboxCalendar = Get-MailboxFolderPermission -Identity $calendarPath

    # Adds the results to the array
    $calendarPermissions += $mailboxCalendar
}

# Export the results to an Excel file. You can then format it as a table. 
$calendarPermissions | Export-Csv -Path "C:\Results.Csv" -NoTypeInformation
#Export Results to a Text File instead
$calendarPermissions > "C:\TextFileRes.txt"
#Hash out all commands here to display results in powershell
##BattleSpaceAlpha
