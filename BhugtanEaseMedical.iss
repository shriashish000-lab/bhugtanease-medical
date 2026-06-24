; ============================================================
; BhugtanEase Medical — Windows Installer Script (Inno Setup)
; Compatible: Windows 7 / 8 / 8.1 / 10 / 11  (32-bit and 64-bit)
; ============================================================

#define MyAppName "BhugtanEase Medical"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "BhugtanEase"
#define MyAppExeName "BhugtanEase_Medical.exe"

[Setup]
AppId={{A1F2C9E4-7B3D-4E1A-9C5F-BHUGTANMED01}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
; No "ArchitecturesAllowed=x64" — keeping installer itself 32-bit so it
; runs natively on Windows 7/8/10/11, both 32-bit and 64-bit editions.
OutputDir=installer_output
OutputBaseFilename=BhugtanEase_Medical_Setup
SetupIconFile=app_icon.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin
UninstallDisplayIcon={app}\{#MyAppExeName}
MinVersion=6.1sp1

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop shortcut"; GroupDescription: "Additional shortcuts:"

[Files]
Source: "dist\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\Uninstall {#MyAppName}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "Launch {#MyAppName}"; Flags: nowait postinstall skipifsilent
