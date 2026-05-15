@echo off
chcp 65001 >nul
cd /d "%~dp0"
title ACBuy Archive preview :8766
echo.
echo Serving folder: %cd%
echo Open: http://127.0.0.1:8766/
echo (Port 8766 avoids conflict with Kakobuyslink preview on 8765.)
echo.
npx --yes serve . -l tcp://127.0.0.1:8766 --no-port-switching
pause
