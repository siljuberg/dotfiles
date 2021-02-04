rem Remove Azure Classify
REG ADD "HKEY_CLASSES_ROOT\AllFilesystemObjects\shell\Microsoft.Azip.RightClick" /f /t REG_SZ /d "LegacyDisable"
REG DELETE "HKEY_CLASSES_ROOT\AllFilesystemObjects\shell\Microsoft.Azip.RightClick" /f

rem Delete Share with Skype
REG DELETE "HKEY_CLASSES_ROOT\PackagedCom\ClassIndex\{776DBC8D-7347-478C-8D71-791E12EF49D8}" /f 

rem Remove Azure Classify
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /f /t REG_SZ /d "{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}"
