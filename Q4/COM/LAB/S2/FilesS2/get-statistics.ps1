[CmdLetBinding()]
Param (
   [Parameter(Mandatory=$True, Position=1,
          HelpMessage="The input file, containing the temperatures data in CSV format.")]
   [Alias("File")]
   [string]$inputFile = "Help",

   [Parameter(Mandatory=$True, Position=2,
          HelpMessage="Month,Day")]
   [Alias("d")]
   [string]$md = "01,17"
)

#echo argument inputfile ${inputFile}

$smd = "^" + $md

$DayData = (type ${inputFile} | select-string -pattern day,$smd | % { $_.Line })
$DayData >data.tmp.csv
$temperatures = (Import-CSV data.tmp.csv).temp
if ( $temperatures.Count -ne 0 ) {
   $celsius = ($temperatures) | % {([float]$_-32.0)*5.0/9.0}
   $stats = ($temperatures | Measure-object -Average | Select-object -property Average)
   $stats
   $stats = ($celsius |  Measure-object -Average | Select-object -property Average)
   $stats
}
else {
   echo "No data for $md"
}
