@echo off
rem "C:\Program Files\Schlumberger\PIPESIM2020.1\Programs\psimstub.exe" -X %1
start %~n1.plt
timeout 7
taskkill /IM "PSPlotX.exe"