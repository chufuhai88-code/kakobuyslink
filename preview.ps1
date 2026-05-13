# Cursor / PowerShell 本地预览（请用系统 Chrome 或 Edge 打开，不要用 Cursor 内置 Simple Browser）
$ErrorActionPreference = "Stop"
$root = $PSScriptRoot
Set-Location $root

if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
    Write-Host "[错误] 未找到 python。请安装 Python 并勾选 Add to PATH，或双击运行 preview-node.bat" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "即将在新窗口启动静态服务（请勿关闭该黑窗）…" -ForegroundColor Cyan
Write-Host "地址（请复制到 Chrome / Edge）: http://127.0.0.1:8080/" -ForegroundColor Green
Write-Host "若仍提示连接被重置：① 确认黑窗里没有报错 ② 换 Chrome 地址栏直接打开上述 URL ③ 试 preview-port8765.ps1" -ForegroundColor Yellow
Write-Host ""

Start-Process -FilePath "cmd.exe" -ArgumentList @(
    "/k", "chcp 65001 >nul && cd /d `"$root`" && title Kakobuy 本地预览 :8080 && python -m http.server 8080 --bind 127.0.0.1"
)

Start-Sleep -Seconds 2
Start-Process "http://127.0.0.1:8080/"
