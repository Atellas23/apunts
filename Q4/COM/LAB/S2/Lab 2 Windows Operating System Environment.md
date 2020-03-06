# Lab 2: Windows Operating System Environment

## Exercise 1

Executing `alias` in a PowerShell, Windows lists all the alias used in the PowerShell command interpreter. The translations asked are:
- `ls`: `Get-ChildItem`
- `dir`: `Get-ChildItem`
- `cd`: `Set-Location`
- `copy`: `Copy-Item`
- `history`: `Get-History`
- `start`: `Start-Process`
----------

## Exercise 2

The outputs are the following:
```
> Get-Item alias:ls
CommandType     Name                                               Version    Source       
-----------     ----                                               -------    ------       
Alias           ls -> Get-ChildItem                                                        
```

This command looks for the translation of the alias `ls`. In fact, when executed with `alias:start`, for example, or any of the above translations, it spits out their translation.

```
> Get-Item “.”
    Directorio: C:\Users\alex.batlle


Mode                LastWriteTime         Length Name                                      
----                -------------         ------ ----                                      
d-r---       18/02/2020     10:19                Documents                                 
```

This command outputs the name and some properties of the current directory.

```
> Get-ChildItem “.”
    Directorio: C:\Users\alex.batlle\Documents


Mode                LastWriteTime         Length Name                                      
----                -------------         ------ ----                                      
-a----       18/02/2020     10:19              0 answers.txt                     
```

This command outputs the name of the files and folders inside the current directory.

```
> Get-ChildItem “.” -Recurse -Include “answers.txt”
    Directorio: C:\Users\alex.batlle\Documents


Mode                LastWriteTime         Length Name                                      
----                -------------         ------ ----                                      
-a----       18/02/2020     10:19              0 answers.txt                     
```

```
> Select-String history answers.txt
answers.txt:9:- history: Get-History
answers.txt:46:> Select-String history answers.txt
```
This command looks for a string in a file (similar to grep in linux).

## Exercise 3

The command is `$env:Path = "$Home\bin\;$env:Path"`

## Exercise 4

```
Windows edition: Windows 10 Enterprise
Processor: Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz  3.41GHz
Installed memory (RAM): 16,0 GB
System type: 64 bits Operative System, x64 processor
Computer Name: c6s302pc22
Workgroup: stark.fib.upc.es
```
----------

## Exercise 5

```
TEMP: C:\Users\ALEX~1.BAT\AppData\Local\Temp
ComSpec: C:\windows\system32\cmd.exe
NUMBER_OF_PROCESSORS: 8
OS: Windows_NT
```
----------

## Exercise 6

Issuing `cmd` starts an instance of the Windows Command Prompt directly in the PowerShell window, while issuing `start cmd` opens a Command Prompt in a new window. If we run `start cmd -NoNewWindow` things get bugged; commands are not well interpreted or written. But, if we run the same command with the flag `-Wait`, this is, `start cmd -NoNewWindow -Wait`, PowerShell waits for the cmd process to stop before reading anything, so the two processes run smoothly.

## Exercise 7

By simply running it, we can see that given a date in the format "month,day", the program tells us what the average temperature was on that day of that month in a certain year. Inspecting the data, we can see that the temperature was logged every 5 minutes during almost a month.
Reading its code, we can see that first of all, the code states the parameters it reads from the command line, in this case both with `Mandatory=$True` indicating that the program does not continue without them.
Then, the program proper first changes the input month/day to a format it can understand. Then, it reads from the data file all the lines that have the pattern that has been created representing the input date, and it saves this lines into a temporary file. This will be from now on the file on which the program will operate. After writing into the temporary file, it converts the temperature data from Fahrenheit to Celsius and this is saved into a variable called `$celsius`. It then calculates the average of both of these arrays with the instructions `($temperatures | Measure-object -Average | Select-object -property Average)` and `($celsius | Measure-object -Average | Select-object -property Average)`, and saves this result into the variable `$stats`. After each of these instructions, the value of `$stats` is printed out in the screen.

It is worth noting, the program has a conditional structure, accounting for the possibility of lacking data for the date issued; it checks if the size of `$temperatures` is zero, and if it is, the line with `echo "No data for $md"` is executed, with `$md` being the variable where the date input data is saved.

## Exercise 8

If we look carefully into the script, we can see the lines calculating the average have the `-Average` flag and a later selection of this same number. So, if we remove this flag and tinker around a little with the flags that the PowerShell scripting language allows, we can easily find the flags `-Maximum` and `-Minimum`. Then, the way to go is clear: we should replace the `-Average` flag with these ones. With a quick search on the internet, we can see that the CMDLet Select-Object accepts multiple arguments when using `-Property`, so we should replace the inside of the conditional block with the following lines:
```
if ( $temperatures.Count -ne 0 ) {
   $celsius = ($temperatures) | % {([float]$_-32.0)*5.0/9.0}
   ($stats = ($temperatures | Measure-object -Minimum -Maximum | Select-object -property Minimum,Maximum))
   ($celsius_stats = ($celsius | Measure-object -Minimum -Maximum | Select-object -property Minimum,Maximum))
   rm data.tmp.csv
}
```

Note: I also included the `rm data.tmp.csv` line inside each conditional code block, as I consider good practice erasing temporary files after having finished using them.