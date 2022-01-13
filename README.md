# What is it?
This is a minimal Docker image for Microsoft SQL Server 2019, built over Debian Stable Slim.

# Why? 
Because I personnaly use it, and if it is useful to someone, why not share it?

# How to use it?
## using docker
For example : `sudo docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=<YourStrong@Passw0rd>" -p 1433:1433 --name sql1 -h sql1 -d abesnier/mssql`

Parameter | Description
---|---
-e "ACCEPT_EULA=Y" | Set the ACCEPT_EULA variable to any value to confirm your acceptance of the End-User Licensing Agreement. Required setting for the SQL Server image.
-e "SA_PASSWORD=<YourStrong@Passw0rd>" | Specify your own strong password that is at least eight characters and meets the [SQL Server password requirements](https://docs.microsoft.com/en-us/sql/relational-databases/security/password-policy?view=sql-server-ver15). Required setting for the SQL Server image.
-p 1433:1433 |	Map a TCP port on the host environment (first value) with a TCP port in the container (second value). In this example, SQL Server is listening on TCP 1433 in the container and this is exposed to the port, 1433, on the host.
--name sql1 | Specify a custom name for the container rather than a randomly generated one. If you run more than one container, you cannot reuse this same name.
-h sql1 | Used to explicitly set the container hostname. If you don't specify the hostname, it defaults to the container ID, which is a randomly generated system GUID.
abesnier/mssql | My SQL Server 2019 container image.

(shamelessly copied from [MS Instructions](https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-ver15&pivots=cs1-bash))

## using docker-compose
Have a look at the sample [docker-compose.yml](https://github.com/abesnier/docker-mssql/blob/main/docker-compose.yml)


# License
This Docker image install the Developper edition of MS Sql Server 2019.

SQL Server is licensed the same for Linux and Windows. For more information about SQL Server licensing and pricing, see [How to license SQL Server](https://www.microsoft.com/sql-server/sql-server-2017-pricing).
