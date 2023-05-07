# WindowsServerSetup

### Variables

$Desktop="$HOME\Desktop"
$SetupDir="$HOME\Desktop\ServerSetup"

### Download Path
$SakuraEditor="https://github.com/sakura-editor/sakura/releases/download/v2.4.2/sakura-tag-v2.4.2-build4203-a3e63915b-Win32-Release-Installer.zip"
$Apache="https://www.apachelounge.com/download/VS17/binaries/httpd-2.4.57-win64-VS17.zip"

### Create Setup Directory

mkdir $Desktop\ServerSetup

### Install Sakura Editor

"Install Sakura Editor" | Out-GridView 

mkdir $SetupDir\sakura 
wget $SakuraEditor -O $SetupDir\sakura\sakura.zip
Expand-Archive -Path $SetupDir\sakura\sakura.zip -DestinationPath $SetupDir\sakura -Force
mv $SetupDir\sakura\sakura*.exe $SetupDir\sakura\sakura_installer.exe
Start-Process -FilePath $SetupDir\sakura\sakura_installer.exe -ArgumentList "/S" -Wait

### Install Apache

"Install Apache" | Out-GridView 

mkdir $SetupDir\apache
curl -L -o $SetupDir\apache\apache.zip $Apache 
xpand-Archive -Path $SetupDir\apache\apache.zip -DestinationPath $SetupDir\apache -Force
cp -rp $SetupDir\apache\Apache24 "C:\"

