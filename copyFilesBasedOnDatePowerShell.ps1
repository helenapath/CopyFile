#1) Define the source and destination folder to copy data to/from.
#2) Defined the create date range of the files to be copied using get-date cmdlet.
#4) Identify files in source folder that matches the date criteria.
#5) Recurse through the list of files to be copied and copy file

Write-Host "Script to Move Files Based on Date"
$Source = "C:\Source\"
$Destination = "C:\Destination"
$StartDate =get-date.day
$EndDate =$date.adddays(-2)


$Files = Get-ChildItem -Path $source -File |Where-Object { $_.CreationTime -ge $StartDate  -and $_.CreationTime -le $EndDate  }

#recurse through each file that meets the criteria
foreach ($File in $Files)
{
	copy-item $File $destination
	write-host "copying $File"
} 


