# WindowsServerSetup

### Variables

$Desktop="$HOME\Desktop"
$SetupDir="$HOME\Desktop\ServerSetup"

### Download Path
$SakuraEditor="https://github.com/sakura-editor/sakura/releases/download/v2.4.2/sakura-tag-v2.4.2-build4203-a3e63915b-Win32-Release-Installer.zip"
$Apache="https://www.apachehaus.com/downloads/httpd-2.4.55-o111s-x86-vs17.zip"

### Create Setup Directory

if (-not(TEST-Path $SetupDir)) {
  mkdir $Desktop\ServerSetup
}

### Install Sakura Editor

if (-not(TEST-Path $SetupDir\sakura)) {
  mkdir $SetupDir\sakura
}

wget $SakuraEditor -O $SetupDir\sakura\sakura.zip
Expand-Archive -Path $SetupDir\sakura\sakura.zip -DestinationPath $SetupDir\sakura -Force
mv $SetupDir\sakura\sakura*.exe $SetupDir\sakura\sakura_installer.exe
Start-Process -FilePath $SetupDir\sakura\sakura_installer.exe -ArgumentList "/S" -Wait

### Install Apache

if (-not(TEST-Path $SetupDir\apache)) {
  mkdir $SetupDir\apache
}

wget $Apache -o $SetupDir\apache\apache.zip
Expand-Archive -Path $SetupDir\apache\apache.zip -DestinationPath $SetupDir\apache -Force
cp -r $SetupDir\apache\Apache24 "C:\"

if (-not(Test-Path "C:\Apache24")) {
  echo "Apache does not installed"
  exit
} else {
  cp C:\Apache24\httpd\conf\httpd.conf C:\Apache24\httpd\conf\httpd.conf.org
}
