# 备用端口（8080 被占用或防火墙策略时使用）
$root = $PSScriptRoot
Set-Location $root

if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
    Write-Host "[错误] 未找到 python。" -ForegroundColor Red
    exit 1
}

$port = 8765
Write-Host "备用端口: http://127.0.0.1:$port/" -ForegroundColor Green

Start-Process -FilePath "cmd.exe" -ArgumentList @(
    "/k", "chcp 65001 >nul && cd /d `"$root`" && title Kakobuy 本地预览 :$port && python -m http.server $port --bind 127.0.0.1"
)

Start-Sleep -Seconds 2
Start-Process "http://127.0.0.1:$port/"
