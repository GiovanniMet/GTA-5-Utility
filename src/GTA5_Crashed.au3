
Func KillaProcesso($process)
  $processid = ProcessExists($process)
  If $processid Then
	 ProcessClose($process)
  Endif
EndFunc

KillaProcesso("GTA5.exe")
KillaProcesso("GTAVLauncher.exe")