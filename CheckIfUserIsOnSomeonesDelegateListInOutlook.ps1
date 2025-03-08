# Replace UserA and UserB with the actual email addresses or aliases of the users you want to check
#User A is the mailbox being checked. User B is the prospective delegate
$UserA = "user1@company.com"
$UserB = "user2@company.com"

# Get the mailbox permissions for User A
$MailboxPermissions = Get-MailboxPermission -Identity $UserA

# Check if User B's email address is present in the mailbox permissions
$IsDelegate = $MailboxPermissions | Where-Object { $_.User -like $UserB }

if ($IsDelegate) {
    Write-Host "$UserB is a delegate for $UserA."
} else {
    Write-Host "$UserB is not a delegate for $UserA."
}
