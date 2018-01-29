#Batchfile for distributing Sysmon through Group Policy.
#The Files as well as the XML config will be required to be on a network share, with read access to share only, preferably.
#You can run this task one of two ways: either locally as system, or as managed service account.
#Because of this, the read access on the share is imperitive as otherwise someone potentially could distribute whatever you liked
#throughout the network if they gained write access to it. 

copy /z /y "\\location\of\share\sysmon.xml" "C:\windows\"
sysmon -c c:\windows\sysmon.xml -n
 
sc query "Sysmon" | Find "RUNNING"
If "%ERRORLEVEL%" EQU "1" (
goto startsysmon
)
:startsysmon
net start Sysmon
 
If "%ERRORLEVEL%" EQU "1" (
goto installsysmon
)
:installsysmon
"\\location\of\sysmon\executable\sysmon64.exe" /accepteula -i c:\windows\sysmon.xml -n

net stop winrm
net start winrm
