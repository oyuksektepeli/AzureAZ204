#create a folder
mkdir DotnetDocker

#create dotnet application
dotnet new console -n DotNetDocker

#go to project folder
cd .\DotNetDocker\

#open vscode 
code . 

#create dockerfile
# FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
# COPY bin/Release/netcoreapp3.1/publish/ App/
# WORKDIR /App
# ENTRYPOINT ["dotnet", "NetCore.Docker.dll"]

#build Container
build -t dotnettest -f Dockerfile .

#create container
docker create --name dotnettest1 dotnettest

#run application on container
dotnet run -it --rm --entrypoint "cmd.exe" dotnettest1

#output
Hello World!