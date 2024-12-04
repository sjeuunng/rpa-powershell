$env:LC_ALL = 'C.UTF-8'

Function Monitor-Process {
    param (
        [string]$ProcessName,
        [int]$CheckInterval = 5
    )

    Write-Host "프로세스 '$ProcessName' 모니터링 시작. . ." -ForegroundColor Cyan

    while ($true) {
        $process = Get-Process -Name $ProcessName -ErrorAction SilentlyContinue

        if (-not $process) {
            [System.Windows.Forms.MessageBox]::Show("프로세스 '$ProcessName'가 종료되었습니다.", "알림!", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
            Write-Host "프로세스 '$ProcessName'가 종료되었습니다." -ForegroundColor Red

            break
         }

    Start-Sleep -Seconds $CheckInterval
    }
}

Add-Type -AssemblyName System.Windows.Forms

$targetProcess = "notepad"

Monitor-Process -ProcessName $targetProcess -CheckInterval 5
