Set-ExecutionPolicy RemoteSigned
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Tested and works fine
choco install notepadplusplus winmerge autohotkey vscode notion git everything  sublimetext3.app fiddler sysinternals firefox listary caffeine sharpkeys wireshark evernote telnet foxitreader spotify

#Not working properly on SLB machine
choco install regscanner 7zip

# Disabled. 
#choco install nmap