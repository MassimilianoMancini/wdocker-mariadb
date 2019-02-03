#
# Bootstrap file for:
#               wdocker-mariadb
#

# Functions
function Confirm-Directory {
    param( [string]$InputDir )
    if ((Test-Path -Path $InputDir) -eq $false)
    {
       Write-Output "[$(Get-Date)]: The dir $InputDir does not exist. Creating it.. "
       New-Item -ItemType Directory -Path $InputDir 
       Start-Process -FilePath "c:\mariadb\bin\mysql_install_db.exe" -ArgumentList "--datadir=$InputDir" -NoNewWindow -Wait
    }
   }
   
   # Check if the config dirs are created, be sure to use a volume mount for this data.
   Write-Output "[$(Get-Date)]: Checking config dirs in volume mount.. "
   Confirm-Directory "c:\mariadbdata\db\"

   
   Write-Output "[$(Get-Date)]: Bootstrapping mysqld.exe.. "
   & c:\mariadb\bin\mysqld.exe --console --datadir=c:\mariadbdata\db\