#1) Define source folder to copy data from
#2) Define destination folder to copy data to
#3) Defined the create date range of the files to be copied
#4) Identify files in source folder that matches the date criteria
#5) Recurse through the list of files to be copied and copy file
#1) Define source folder to copy data from
#2) Define destination folder to copy data to
#3) Defined the create date range of the files to be copied
#4) Identify files in source folder that matches the date criteria
#5) Recurse through the list of files to be copied and copy file

Write-Host "Script to Move Files Based on Date"
$source = "C:\Helena\Resume\2024\Job Applications 2024\1Knowledge Articles\"
$destination = "C:\Helena\Resume\2024\Job Applications 2024\1Knowledge Articles\test"
$DateGrThan = "06/21/2024"
$DateLessThan = "06/30/2024"

$Files = Get-ChildItem -Path $source -File |Where-Object { $_.CreationTime -ge $DateGrThan  -and $_.CreationTime -le $DateLessThan  }

#recurse through each file that meets the criteria
foreach ($File in $Files)
{
	copy-item $File $destination
	write-host "copying $File"
} 


