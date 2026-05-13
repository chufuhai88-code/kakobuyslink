@echo off
chcp 65001 >nul
cd /d "%~dp0"

where npx >nul 2>&1
if errorlevel 1 (
  echo [错误] 未检测到 npx。请安装 Node.js LTS: https://nodejs.org/
  pause
  exit /b 1
)

echo 正在打开「服务」窗口（首次会下载依赖，可能较慢）…
start "KakobuyPreviewNode" cmd /k call "%~dp0run-server-node.bat"

echo 等待服务启动…
timeout /t 5 /nobreak >nul

start "" "http://127.0.0.1:8765/"
echo 请打开: http://127.0.0.1:8765/  （若黑窗报错端口占用，可改 run-server-node.bat 里的端口号）
pause
