#1) Define the source and destination folder to copy data to/from.
#2) Defined the create date range of the files to be copied using get-date cmdlet.
#4) Identify files in source folder that matches the date criteria.
#5) Recurse through the list of files to be copied and copy file. Throw error if file is not copied

Write-Host "Script to Move Files Based on Date"
$Source = "C:\Source\"
$Destination = "C:\Destination"
$date = Get-Date
$StartDate = $Date.day
$EndDate =$Date.adddays(-2)


$Files = Get-ChildItem -Path $source -File |Where-Object { $_.CreationTime -ge $StartDate  -and $_.CreationTime -le $EndDate  }

#recurse through each file that meets the criteria
foreach ($File in $Files)
{
	try
		{
			copy-item $File $destination
			write-Host "Copied $File Success"
		} 

	Catch
		{
			write-Host "Copy $File Failure"
		}
} #End of For loop
