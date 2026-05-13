@echo off
chcp 65001 >nul
cd /d "%~dp0"
title Kakobuy 本地预览 :8080
echo.
echo 服务地址（请优先用这个，不要写错端口）:
echo   http://127.0.0.1:8080/
echo.
echo 请勿关闭本窗口。
echo 若 Cursor 内置浏览器提示 Connection reset：请用系统 Chrome 或 Edge 在地址栏打开上面链接。
echo localhost 若异常，请始终使用 127.0.0.1 。
echo.
python -m http.server 8080 --bind 127.0.0.1
if errorlevel 1 (
  echo.
  echo [失败] python 命令不可用。请安装 Python 并勾选「Add to PATH」，或改用 preview-node.bat
  pause
)
