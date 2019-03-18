#include <Array.au3>

Func _ProcessSuspend($process)
$processid = ProcessExists($process)
If $processid Then
    $ai_Handle = DllCall("kernel32.dll", 'int', 'OpenProcess', 'int', 0x1f0fff, 'int', False, 'int', $processid)
    $i_sucess = DllCall("ntdll.dll","int","NtSuspendProcess","int",$ai_Handle[0])
    DllCall('kernel32.dll', 'ptr', 'CloseHandle', 'ptr', $ai_Handle)
    If IsArray($i_sucess) Then
        Return 1
    Else
        SetError(1)
        Return 0
    Endif
Else
    SetError(2)
    Return 0
Endif
EndFunc

Func _ProcessResume($process)
$processid = ProcessExists($process)
If $processid Then
    $ai_Handle = DllCall("kernel32.dll", 'int', 'OpenProcess', 'int', 0x1f0fff, 'int', False, 'int', $processid)
    $i_sucess = DllCall("ntdll.dll","int","NtResumeProcess","int",$ai_Handle[0])
    DllCall('kernel32.dll', 'ptr', 'CloseHandle', 'ptr', $ai_Handle)
    If IsArray($i_sucess) Then
        Return 1
    Else
        SetError(1)
        Return 0
    Endif
Else
    SetError(2)
    Return 0
Endif
EndFunc

Func SoloSession()
   Local $processo = ProcessExists("GTA5.exe")
   If ($processo > 0) Then
	  _ProcessSuspend($processo)
	  Sleep(10000)
	  _ProcessResume($processo)
	  WinActivate("Grand Theft Auto V")
   EndIf
EndFunc

Func ChiudiNotepad()
   Local $processo = ProcessExists("Notepad2.exe")
   If ($processo > 0) Then
	  ProcessClose ($processo)
   EndIf
   Local $processo = ProcessExists("notepad.exe")
   If ($processo > 0) Then
	  ProcessClose ($processo)
   EndIf
EndFunc

Func Main()
   Run("notepad.exe")
   SoloSession()
   ChiudiNotepad()
EndFunc

Main()