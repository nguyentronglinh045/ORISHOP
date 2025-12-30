# ============================================================
# ORISHOP - Code Formatter Script
# Script format code cho du an ORISHOP
# ============================================================

param(
    [Parameter(Position=0)]
    [ValidateSet("apply", "check", "help")]
    [string]$Action = "apply"
)

# Mau sac console
$Green = "Green"
$Yellow = "Yellow"
$Cyan = "Cyan"
$Red = "Red"

function Write-Banner {
    Write-Host ""
    Write-Host "  ╔═══════════════════════════════════════════════════════════╗" -ForegroundColor $Cyan
    Write-Host "  ║              ORISHOP - CODE FORMATTER                     ║" -ForegroundColor $Cyan
    Write-Host "  ║           Format code tu dong voi Spotless                ║" -ForegroundColor $Cyan
    Write-Host "  ╚═══════════════════════════════════════════════════════════╝" -ForegroundColor $Cyan
    Write-Host ""
}

function Show-Help {
    Write-Host ""
    Write-Host "  Cach su dung:" -ForegroundColor $Yellow
    Write-Host "    .\format-code.ps1 [action]" -ForegroundColor White
    Write-Host ""
    Write-Host "  Cac action:" -ForegroundColor $Yellow
    Write-Host "    apply   - Format toan bo code trong du an (mac dinh)" -ForegroundColor White
    Write-Host "    check   - Kiem tra code co dung format khong (khong sua)" -ForegroundColor White
    Write-Host "    help    - Hien thi huong dan nay" -ForegroundColor White
    Write-Host ""
    Write-Host "  Vi du:" -ForegroundColor $Yellow
    Write-Host "    .\format-code.ps1           # Format toan bo" -ForegroundColor White
    Write-Host "    .\format-code.ps1 apply     # Format toan bo" -ForegroundColor White
    Write-Host "    .\format-code.ps1 check     # Chi kiem tra" -ForegroundColor White
    Write-Host ""
    Write-Host "  Cac file duoc format:" -ForegroundColor $Yellow
    Write-Host "    - Java files (*.java)" -ForegroundColor White
    Write-Host "    - JSP files (*.jsp)" -ForegroundColor White
    Write-Host "    - XML files (*.xml)" -ForegroundColor White
    Write-Host "    - HTML files (*.html)" -ForegroundColor White
    Write-Host "    - CSS files (*.css)" -ForegroundColor White
    Write-Host "    - JS files (*.js)" -ForegroundColor White
    Write-Host ""
    Write-Host "  Luu y: Thu muc lib (assets/lib) se bi bo qua" -ForegroundColor $Yellow
    Write-Host ""
}

function Format-Apply {
    Write-Host "  [1/2] Dang format code..." -ForegroundColor $Yellow
    Write-Host ""
    
    $result = & mvn spotless:apply 2>&1
    $exitCode = $LASTEXITCODE
    
    if ($exitCode -eq 0) {
        Write-Host ""
        Write-Host "  ✓ Format thanh cong!" -ForegroundColor $Green
        Write-Host "  Toan bo code da duoc format theo chuan Google Java Style." -ForegroundColor White
        Write-Host ""
    } else {
        Write-Host ""
        Write-Host "  ✗ Co loi xay ra khi format!" -ForegroundColor $Red
        Write-Host $result -ForegroundColor $Red
        Write-Host ""
    }
    
    return $exitCode
}

function Format-Check {
    Write-Host "  [1/2] Dang kiem tra format code..." -ForegroundColor $Yellow
    Write-Host ""
    
    $result = & mvn spotless:check 2>&1
    $exitCode = $LASTEXITCODE
    
    if ($exitCode -eq 0) {
        Write-Host ""
        Write-Host "  ✓ Tat ca code da dung format!" -ForegroundColor $Green
        Write-Host ""
    } else {
        Write-Host ""
        Write-Host "  ⚠ Co file chua dung format!" -ForegroundColor $Yellow
        Write-Host "  Chay '.\format-code.ps1 apply' de tu dong sua." -ForegroundColor White
        Write-Host ""
    }
    
    return $exitCode
}

# Main
Write-Banner

switch ($Action) {
    "apply" {
        Format-Apply
    }
    "check" {
        Format-Check
    }
    "help" {
        Show-Help
    }
    default {
        Format-Apply
    }
}
