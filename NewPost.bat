echo off
chcp 65001
set /p fileName=请输入要新建的文章文件名字:
set /p postName=请输入要新建的文章名字:
:: Use WMIC to retrieve date and time
FOR /F "skip=1 tokens=1-6" %%G IN ('WMIC Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:table') DO (
   IF "%%~L"=="" goto s_done
      Set _yyyy=%%L
      Set _mm=00%%J
      Set _dd=00%%G
      Set _hour=00%%H
      SET _minute=00%%I
      SET _second=00%%K
)
:s_done

:: Pad digits with leading zeros
      Set _mm=%_mm:~-2%
      Set _dd=%_dd:~-2%
      Set _hour=%_hour:~-2%
      Set _minute=%_minute:~-2%
      Set _second=%_second:~-2%

Set logtimestamp=%_yyyy%-%_mm%-%_dd% %_hour%:%_minute%:%_second%
cd "%~dp0source\_posts\"
md "%fileName%"
type nul>"%fileName%.md"
echo --->"%fileName%.md"
echo title: %postName%>>"%fileName%.md"
echo date: %logtimestamp%>>"%fileName%.md"
echo categories: [] >>"%fileName%.md"
echo tags: []>>"%fileName%.md"
echo --->>"%fileName%.md"
chcp 936
start /I %fileName%.md
