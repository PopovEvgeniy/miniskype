[Setup]
MinVersion=10.0.19045
AppId={{B4E90873-B789-48A0-9210-9D4C176E080A}
AppName=Mini skype
AppVersion=0.5.5
AppPublisher=Popov Evgeniy Alekseyevich
AppPublisherURL=https://github.com/PopovEvgeniy/miniskype
AppSupportURL=https://github.com/PopovEvgeniy/miniskype
AppUpdatesURL=https://github.com/PopovEvgeniy/miniskype
DefaultDirName={commonpf}\Mini skype
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
DefaultGroupName=Mini skype
DisableProgramGroupPage=yes
InfoBeforeFile=.\readme.txt
LicenseFile=.\copying.txt
PrivilegesRequired=admin
OutputDir=.
OutputBaseFilename=miniskype_setup
Compression=lzma2/max
SolidCompression=yes
UsePreviousAppDir=yes
Uninstallable=WizardIsTaskSelected('normalinstall')
WizardStyle=modern

[Languages]
Name: english; MessagesFile: compiler:Default.isl

[Files]
Source: .\miniskype.exe; DestDir: {app}; Flags: ignoreversion
Source: .\copying.txt; DestDir: {app}; Flags: ignoreversion
Source: .\readme.txt; DestDir: {app}; Flags: ignoreversion
Source: .\source.zip; DestDir: {app}; Flags: ignoreversion; Components: source
Source: .\WebView2Loader.dll; DestDir: {app}; Flags: ignoreversion

[Icons]
Name: {autodesktop}\Mini skype; Filename: {app}\miniskype.exe; Tasks: normalinstall;

[Run]
Filename: {app}\miniskype.exe; Description: {cm:LaunchProgram,Mini skype}; Flags: nowait postinstall skipifsilent

[Components]
Name: Main; Description: Main components; Flags: fixed; Types: minimalinstallation fullinstall
Name: Source; Description: Source code; Types: fullinstall; Flags: fixed

[Types]
Name: fullinstall; Description: Full installation; Flags: iscustom
Name: minimalinstallation; Description: Minimal installation

[Tasks]
Name: normalinstall; Description: Normal installation; Flags: exclusive
Name: portableinstall; Description: Portable installation; Flags: exclusive unchecked

[UninstallDelete]
Type: filesandordirs; Name: "{localappdata}\Mini skype"