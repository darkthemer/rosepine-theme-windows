; From https://github.com/niivu/Windows-10-themes/files/8676818/TBarIconBlanker.zip

#Persistent
#NoEnv
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

#SingleInstance Force
#NoTrayIcon

DetectHiddenWindows, Off
OnExit, Cleanup
SysGet, TBarHeight, 4
Menu, Tray, NoStandard
Menu, Tray, Add, Exit, Cleanup
Gui +LastFound
hWnd := WinExist()
DllCall( "RegisterShellHookWindow", UInt, hWnd )
MsgNum := DllCall( "RegisterWindowMessage", Str, "SHELLHOOK" )
OnMessage( MsgNum, "ShellMessage" )
VarSetCapacity( AndMask, 32*4, 0xFF ), VarSetCapacity( XorMask, 32*4, 0 )
hIcon := DllCall( "CreateCursor", Uint, 0, Int, 0, Int, 0, Int, 32, Int, 32, Uint, &AndMask, Uint, &XorMask )
WinGet, s, List
Loop, % s
{
	s := s%A_Index%
}
Return
Cleanup:
{
	If ( MinMaxCloseOption = 1 )
	{
		WinGet, s, List
		Loop, % s
		{
			s := s%A_Index%
			WinSet, Style, +0x80000, % "ahk_id " . s
		}
	}
ExitApp
}
Return
WatchCursor:
{
	MouseGetPos, , yPos, CurrID,
	If ( yPos >= 0 and yPos < ( TBarHeight + 3 ) )
	{
		WinSet, Style, +0x80000, % "ahk_id " . CurrID
		SendMessage, 0x80, 0, hIcon, , % "ahk_id " . CurrID
	}
	Else
	{
		WinSet, Style, -0x80000, % "ahk_id " . PrevID
		WinSet, Style, -0x80000, % "ahk_id " . CurrID
		SendMessage, 0x80, 0, hIcon, , % "ahk_id " . CurrID
	}
}
Return
ShellMessage( wParam, lParam )
{
	Global hIcon, MinMaxCloseOption, PrevID
	If wParam in 1,6,32772
	{
		SendMessage, 0x80, 0, hIcon, , % "ahk_id " . lParam
		If ( MinMaxCloseOption = 1 )
		{
			WinSet, Style, -0x80000, % "ahk_id " . lParam
		}
	}
	PrevID := lParam
}