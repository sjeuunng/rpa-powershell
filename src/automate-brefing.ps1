$env:LC_ALL = 'C.UTF-8'

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

# 현 시각 보고자 명단
$Reporter = Get-Content "C:\Users\wadmin\Desktop\자동화\보고자.txt"

# 금일 야간 당직자 명단
$Val_1 = Get-Content "C:\Users\wadmin\Desktop\자동화\금일 야간 당직자.txt"

# 내일 주간 당직자 명단
$Val_2 = Get-Content "C:\Users\wadmin\Desktop\자동화\내일 주간 당직자.txt"

# 내일 야간 당직자 명단
$Val_3 = Get-Content "C:\Users\wadmin\Desktop\자동화\내일 야간 당직자.txt"

# 내일 주간 당직자(포함) 명단
$Val_4 = Get-Content "C:\Users\wadmin\Desktop\자동화\내일 주간 근무자.txt"

$payload = "자동으로 입력할 텍스트 입력 부분($Reporter, $Val_1, $Val_2, $Val_3, $Val_4 활용)"

$Wshell = New-Object-ComObject Wscript.shell; $Wshell.SendKeys($payload);

Start-Sleep -Seconds 30

[System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point(1850, 800)

Click-MouseButton