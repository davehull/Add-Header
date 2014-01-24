Add-Header
==========

A utility script to combine a header file (i.e. a file with one header row of data and a newline)
and a corresponding data file with no header. This is useful if you're pulling multiple data sets,
say a daily job that pulls data from a system that doesn't prefix the data sets with a header row.

```
PS> Add-Header.ps1 -File data_file -HeaderFile header_file
```
