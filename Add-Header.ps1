<#
.SYNOPSIS
Add-Header.ps1
A utility script to combine a header file (i.e. a file with one header row of data and a newline)
and a corresponding data file with no header. This is useful if you're pulling multiple data sets,
say a daily job that pulls data from a system that doesn't prefix the data sets with a header row.
.PARAMETER File
The data file without a header.
.PARAMETER HeaderFile
The header file without data, make sure it terminates with a newline and that the header and data
files have the same delimiter.
.EXAMPLE
Add-Header.ps1 -File data_file -HeaderFile header_file
#>
[CmdletBinding()]
Param(
    [Parameter(Mandatory=$True,Position=0)]
        [string]$File,
    [Parameter(Mandatory=$True,Position=1)]
        [string]$HeaderFile
)

$HeaderFilebak = $HeaderFile + ".bak"
copy $HeaderFile $HeaderFilebak

gc $File | add-content $HeaderFile
rm $File
move $HeaderFile $File
copy $HeaderFilebak $HeaderFile
