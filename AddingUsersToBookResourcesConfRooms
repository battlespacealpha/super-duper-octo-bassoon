#############################################
##Adding users to resource/conference rooms##
#############################################

#Connecting to Exchange Online#
Connect-ExchangeOnline

#Use this command to add to the bookin policy for a Resource/Room Replace RoomAlias with correct entries OR Email address ex. room1@company.com#

Add-CalendarProcessing -Identity RoomAlias -BookInPolicy ((Get-CalendarProcessing -Identity RoomAlias).BookInPolicy += user@company.com)


##Use this command to confirm that the change took place or to see the bookin policy for a resouce/room##

#Get-CalendarProcessing RoomAlias | select -ExpandProperty BookInPolicy | Get-Recipient | select PrimarySmtpAddress, RecipientType
