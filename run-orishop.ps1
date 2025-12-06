param(
    [switch]$SkipClean,
    [switch]$SkipTests
)

$ErrorActionPreference = "Stop"

Push-Location $PSScriptRoot
try {
    $dbConfig = Join-Path $PSScriptRoot "src\main\resources\database.properties"
    $dbExample = "$dbConfig.example"

    if (-not (Test-Path $dbConfig)) {
        if (Test-Path $dbExample) {
            Copy-Item -Path $dbExample -Destination $dbConfig -ErrorAction Stop
            Write-Host "Created database.properties from template. Please update your SQL Server connection info." -ForegroundColor Yellow
        } else {
            throw "Missing database configuration. Add $dbConfig based on the template $dbExample."
        }
    }

    $mavenArgs = @()
    if (-not $SkipClean) { $mavenArgs += "clean" }
    $mavenArgs += "package"
    $mavenArgs += "cargo:run"
    if ($SkipTests) { $mavenArgs += "-DskipTests" }

    Write-Host "Running: mvn $($mavenArgs -join ' ')" -ForegroundColor Cyan
    $process = Start-Process -FilePath "mvn" -ArgumentList $mavenArgs -NoNewWindow -Wait -PassThru

    if ($process.ExitCode -ne 0) {
        throw "Maven exited with code $($process.ExitCode)."
    }

    Write-Host "Tomcat (cargo) should now be up at http://localhost:9090/ORISHOP-1.0/" -ForegroundColor Green
}
finally {
    Pop-Location
}
