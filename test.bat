@echo off

set ROOT_DIR=%~dp0%
set Install_Folder=%ROOT_DIR:~0,-1%
set DATE_TIME=%date:~6,4%_%date:~3,2%_%date:~0,2%_%TIME:~0,2%%TIME:~3,2%
set Lien_Script=%Install_Folder%
set OutputFolder=%Install_Folder%\output




set Lien_Resultat=%OutputFolder%\result_%BROWSERF%_%DATE_TIME%\
set Lien_Resultat1=%OutputFolder%\result_%BROWSERF%_%DATE_TIME%\

echo ----------------------------------------------------------------
echo ----------------------------------------------------------------
echo ----------------------------------------------------------------
echo Running from  : %Install_Folder%
echo Browser       : %BROWSERF%
echo Result Html   : %Lien_Resultat%
echo ----------------------------------------------------------------
echo ----------------------------------------------------------------
echo ----------------------------------------------------------------


mkdir "%OutputFolder%"
mkdir "%Lien_Resultat%"


pybot  	--log $Lien_Resultat"log.html" --report $Lien_Resultat"report.html" --output $Lien_Resultat"output.xml"		--include run   "%Lien_Script%\scripts" 

