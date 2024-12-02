[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null

Function Click-MouseButton
{
    $Signature = @"
    [DllImport("user32.dll", CharSet=CharSet.Auto, CallingConvention=CallingConvention.StdCall)]
    public static extern void mouse_event(long dwFlags, long dx, long dy, long cButtons, long dwExtraInfo);
"@
    $SendMouseClick = Add-Type -MemberDefinition $Signature -Name "Win32MouseEventNew" -Namespace Win32Functions -PassThru
    $SendMouseClick::mouse_event(0x00000002, 0, 0, 0, 0)
    $SendMouseClick::mouse_event(0x00000004, 0, 0, 0, 0)
}

[System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point(1650, 800)

Click-MouseButton

Start-Sleep -Seconds 30

# 첫 시간 보고서 경로
$Reporter = Get-Content "C:\Users\wadmin\Desktop\자동출결\야간 보고서.txt"

# 첫 번째 야간 당직자 명단
$Val2 = Get-Content "C:\Users\wadmin\Desktop\자동출결\야간 당직자.txt"

# 두 번째 야간 당직자 명단
$Val3 = Get-Content "C:\Users\wadmin\Desktop\자동출결\야간 추가 당직자.txt"

# 세 번째 야간 당직자 명단
$Val4 = Get-Content "C:\Users\wadmin\Desktop\자동출결\야간 근무자.txt"

$payload = "wkdrjswjdtls/디코봇.tk. 09301 hckld gwkjs kdhgjkdhqhwhk: $Reporter/qkdjfifm 0rjs/gogladpdif 0rjs/akdghdsyjd 0rjs/kdklgjdkgkdbrcp(2014whd 23eod) wkqkdl dmdyhr rks dltkdd djtjq"

Set-Content -Path "C:\Users\wadmin\Desktop\자동출결\최종보고서.txt" -Value $payload

Start-Sleep -Seconds 30

[System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point(1850, 800)

Click-MouseButton