FROM mcr.microsoft.com/windows/servercore:ltsc2019

COPY mariadb /mariadb

EXPOSE 3306

WORKDIR c:/mariadb

CMD ["c:/mariadb/bin/mariadbd", "--console"]