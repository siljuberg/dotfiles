@echo off
"C:\Program Files\Schlumberger\PIPESIM2020.1\Programs\psimstub.exe" -X %1
start %~n1.plt
rem timeout 7
rem taskkill /IM "PSPlotX.exe"