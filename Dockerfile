# Awesome Container (Docker Windows): MariaDB
# https://hub.docker.com/r/awesomecontainer/wdocker-mariadb
# https://github.com/AwesomeContainer/wdocker-mariadb

FROM mcr.microsoft.com/windows/servercore:1809

LABEL Description="MariaDB" Vendor="MariaDB Foundation" Version="10.3.12-winx64"
LABEL maintainer="AwesomeContainer"

EXPOSE 3306

COPY Bootstrap.ps1 C:\Bootstrap.ps1

RUN powershell -Command \
    Set-Variable -Name 'ErrorActionPreference' -Value 'Stop'; \
    Invoke-WebRequest -UseBasicParsing -Uri 'https://downloads.mariadb.org/f/mariadb-10.3.12/winx64-packages/mariadb-10.3.12-winx64.zip' -OutFile 'mariadb.zip'; \
    Expand-Archive -Path c:\mariadb.zip -DestinationPath c:\ ; \
    Start-Sleep -Seconds 1; \
    Move-Item -Path 'C:\mariadb-10.3.12-winx64' -Destination 'C:\mariadb\' -Force; \
    New-Item c:\mariadbdata -type directory ; \
    Remove-Item c:\mariadb.zip -Force

WORKDIR /mariadb

VOLUME c:\\mariadbdata

ENTRYPOINT ["powershell", "-ExecutionPolicy", "Unrestricted", "C:\\Bootstrap.ps1"]