#Remove many users at once from an Membership group in Active Directory
#This assumes you have shell access to Active Directory.

#First, let's define the target group and the SAM accounts or usernames
$groupName = "Target Group Name"
$usernames = @(”user1”, 
”user2”, 
”user3”, 
”user4”, 
”user5”, 
”user6”)

#Cycles through each user, specifies each user on the list
foreach ($username in $usernames) {
    try {
        #Collects the user objects and defines the list
        $group = Get-ADGroup $groupName
        $user = Get-ADUser $username

        #Removes the specified users from the group from the specifications above
        #Also displays the names of the users remove or unable to be removed
        Remove-ADGroupMember -Identity $group -Members $user -Confirm:$false

        Write-Host "User $username removed from group $groupName."
    } catch {
        Write-Host "Error removing user $username from group $groupName $_"
    }
}
#Results can be exported to a CSV. It's useful to pull a report prior to doing this if the list is large and comparing the results after.
#Sometimes information provided can be incorrect due to unique usernames that do not match the current naming scheme
