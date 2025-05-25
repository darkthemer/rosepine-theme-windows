; From https://discord.com/channels/148103787259756544/148718731743199233/672620468985135119  # Rainmeter Discord

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#SingleInstance Force
#NoTrayIcon

loop {
	if WinExist("ahk_class Shell_TrayWnd") {
		WinSetTransparent 0
		WinHide
	}
	Sleep 15
}