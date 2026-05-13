@echo off
chcp 65001 >nul
cd /d "%~dp0"

where python >nul 2>&1
if errorlevel 1 (
  echo [错误] 未检测到 python。请先安装 Python ^(https://www.python.org/^) 并勾选 Add to PATH，
  echo 或安装 Node.js 后双击 preview-node.bat
  pause
  exit /b 1
)

echo 正在打开「服务」窗口（请勿关闭）…
start "KakobuyPreview" cmd /k call "%~dp0run-server.bat"

echo 等待服务启动…
timeout /t 3 /nobreak >nul

echo 正在用系统默认浏览器打开（请用 Chrome/Edge，不要用 Cursor 内置预览）…
start "" "http://127.0.0.1:8080/"

echo.
echo 地址必须是: http://127.0.0.1:8080/  （含 :8080；不要用 file:/// 打开文件夹）
echo 若提示 Connection reset：先看黑窗里 python 是否在跑；仍不行请双击 preview-port8765.ps1 换端口。
echo 停止预览：关掉标题含 KakobuyPreview 的黑色窗口。
echo.
pause
