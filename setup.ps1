# WindowsServerSetup


### 定数

$Desktop="$HOME\Desktop"
$SetupDir="$HOME\Desktop\ServerSetup"

### ソフトウェアのパス
$SakuraEditor="https://github.com/sakura-editor/sakura/releases/download/v2.4.2/sakura-tag-v2.4.2-build4203-a3e63915b-Win32-Release-Installer.zip"

### 作業フォルダ作成

mkdir $Desktop\ServerSetup

### さくらエディタのインストール

"Install Sakura Editor" | Out-GridView 

mkdir $SetupDir\sakura 
wget $SakuraEditor -O $SetupDir\sakura\sakura.zip
Expand-Archive -Path $SetupDir\sakura\sakura.zip -DestinationPath $SetupDir\sakura -Force
mv $SetupDir\sakura\sakura*.exe $SetupDir\sakura\sakura_installer.exe
Start-Process -FilePath $SetupDir\sakura\sakura_installer.exe -ArgumentList "/S" -Wait

