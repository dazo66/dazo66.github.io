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
echo ;  这是注释不会显示出来的>>"%fileName%.md"
echo ;  --------->>"%fileName%.md"
echo ;  图片需要使用相对路径进行显示>>"%fileName%.md"
echo ;  --------->>"%fileName%.md"
echo ;  # 这是一级标题>>"%fileName%.md"
echo ;  ## 这是二级标题>>"%fileName%.md"
echo ;  ### 这是三级标题>>"%fileName%.md"
echo ;  #### 这是四级标题>>"%fileName%.md"
echo ;  ##### 这是五级标题>>"%fileName%.md"
echo ;  ###### 这是六级标题>>"%fileName%.md"
echo ;  **加粗**>>"%fileName%.md"
echo ;  *斜体*>>"%fileName%.md"
echo ;  ***斜体加粗***>>"%fileName%.md"
echo ;  ~删除线~>>"%fileName%.md"
echo ;  >这是引用的内容 引用可以嵌套引用>>"%fileName%.md"
echo ;  ---分割线>>"%fileName%.md"
echo ;  ![图片alt](图片地址 "图片title")>>"%fileName%.md"
echo ;  [超链接名](超链接地址 "超链接title")>>"%fileName%.md"
echo ;  - 无序列表内容>>"%fileName%.md"
echo ;  1. 有序列表内容>>"%fileName%.md"
echo ;  表头^|表头^|表头>>"%fileName%.md"
echo ;  ---^|:--:^|---:>>"%fileName%.md"
echo ;  内容^|内容^|内容>>"%fileName%.md"
echo ;  内容^|内容^|内容>>"%fileName%.md"
echo ;  `单行代码`>>"%fileName%.md"
echo ;  ``` >>"%fileName%.md"
echo ;  多行代码>>"%fileName%.md"
echo ;  ```>>"%fileName%.md"
echo ;  注释结束>>"%fileName%.md"

chcp 936
start /I %fileName%.md

