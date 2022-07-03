#This script will gather information on the current system and save the report file to the desktop as a text file.

$ipconfig = ipconfig /all
$netconfig = net config workstation
$netstat= netstat -ano
$tasklist = tasklist
$processes= get-process 
$services= Get-Service 
$date = get-date 
$desktoppath =  [Environment]::GetFolderPath("Desktop")
$desktopsettings =  Get-CimInstance -ClassName Win32_Desktop
$bios_information =  Get-CimInstance -ClassName Win32_BIOS
$computer_system =  Get-CimInstance -ClassName Win32_ComputerSystem
$processor_information  =  Get-CimInstance -ClassName Win32_Processor | Select-Object -ExcludeProperty "CIM*"
$memory_information =  Get-CimInstance -ClassName Win32_PhysicalMemory | Select-Object -ExcludeProperty "CIM*"
$computer_manufacturer_model =  Get-CimInstance -ClassName Win32_ComputerSystem
$hotfixes  =  Get-CimInstance -ClassName Win32_QuickFixEngineering
#Listing Operating System Version Information
$operating_system =  Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property BuildNumber,BuildType,OSType,ServicePackMajorVersion,ServicePackMinorVersion
$local_user_owner =  Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property NumberOfLicensedUsers,NumberOfUsers,RegisteredUser
$logon_session =  Get-CimInstance -ClassName Win32_LogonSession
$User_Logged =  Get-CimInstance -ClassName Win32_ComputerSystem -Property UserName


#Writes a report based on these variable to desktop a file called "report.txt"
$file = $desktoppath + "\\report.txt"
"This is a report of the current system." | Out-File $file 
$date | Out-File $file -append
"======= IP ADDRESS =======================================" | Out-File $file -append
$ipconfig | Out-File $file -Append
"======= NETWORK CONFIGURATION =======================================" | Out-File $file -append
$netconfig | Out-File $file -Append
"======= NETWORK STATUS =======================================" | Out-File $file -append
$netstat | Out-File $file -Append
"======= TASKLIST =======================================" | Out-File $file -append
$tasklist | Out-File $file -Append
"======= PROCESSES =======================================" | Out-File $file -append
$processes | Out-File $file -Append
"======= SERVICES =======================================" | Out-File $file -append
$services | Out-File $file -Append
"======= DESKTOP SETTINGS =======================================" | Out-File $file -append
$desktopsettings | Out-File $file -Append
"======= BIOS INFORMATION =======================================" | Out-File $file -append
$bios_information | Out-File $file -Append
"======= COMPUTER SYSTEM =======================================" | Out-File $file -append
$computer_system | Out-File $file -Append
"======= PROCESSOR INFORMATION =======================================" | Out-File $file -append
$processor_information | Out-File $file -Append
"======= MEMORY INFORMATION =======================================" | Out-File $file -append
$memory_information | Out-File $file -Append
"======= COMPUTER MANUFACTURER MODEL =======================================" | Out-File $file -append
$computer_manufacturer_model | Out-File $file -Append
"======= HOTFIXES =======================================" | Out-File $file -append
$hotfixes | Out-File $file -Append
"======= OPERATING SYSTEM =======================================" | Out-File $file -append
$operating_system | Out-File $file -Append
"======= LOCAL USER OWNER =======================================" | Out-File $file -append
$local_user_owner | Out-File $file -Append
"======= LOGON SESSION =======================================" | Out-File $file -append
$logon_session | Out-File $file -Append
"======= USER LOGGED =======================================" | Out-File $file -append
$User_Logged | Out-File $file -Append
"======= END =======================================" | Out-File $file -append






