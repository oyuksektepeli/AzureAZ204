# App Service Runtime Status

**Windows version**
https://%3Cappname%3E.scm.azureweb-sites.net/Env.cshtml
**Under System Info**

**.Net Version**
 https://<appname>.scm.azurewebsites.net/DebugConsole

 **Run the pollowing command in the command promp**
powershell -command "gci 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Net Framework Setup\NDP\CDF'"

**.Net Core Version**
 https://<appname>.scm.azurewebsites.net/DebugConsole

**run the following command in the command prompt**
dotnet --version

**PHP Version**
 https://<appname>.scm.azurewebsites.net/DebugConsole

 **run the following command in the command prompt**
 php version

 **Default Node.js version**
 az webapp config appsettings list --resource-group <groupname> --name <appname> --query "[?name=='WEBSITE_NODE_DEFAULT_VERSION']"

 **Python version**
https://<appname>.scm.azurewebsites.net/DebugConsole

**run the following command in the command prompt**
python --version
