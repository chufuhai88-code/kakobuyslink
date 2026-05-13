@echo off
chcp 65001 >nul
cd /d "%~dp0"
title Kakobuy 本地预览 Node :8765
echo.
echo 服务地址（请用浏览器打开，与黑窗里显示一致）:
echo   http://127.0.0.1:8765/
echo.
echo 8080 常被其它软件占用；本脚本固定使用 8765，避免自动换端口后打不开。
echo 请勿关闭本窗口。
echo.
REM vercel/serve：固定 IPv4 + 端口；--no-port-switching 防止占用时静默改用随机端口
npx --yes serve . -l tcp://127.0.0.1:8765 --no-port-switching
pause
