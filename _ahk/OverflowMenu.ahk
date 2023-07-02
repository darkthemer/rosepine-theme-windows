; From https://github.com/khanhas/Polybar/blob/master/%40Resources/AHK%20Source%20File/ActivateTray.ahk

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#SingleInstance Force
#NoTrayIcon

DetectHiddenWindows, On

!b::

; If (WinActive, ahk_class NotifyIconOverflowWindow) {

; 	WinHide, ahk_class NotifyIconOverflowWindow

; }
; Else

ControlClick, Button2, ahk_class Shell_TrayWnd

WinGetPos, xtemp, ytemp,,, ahk_class NotifyIconOverflowWindow
; MouseGetPos, X, Y

xpos:=xtemp+9
ypos:=ytemp+18

WinMove, ahk_class NotifyIconOverflowWindow, , %xpos%, %ypos%
WinActivate, ahk_class NotifyIconOverflowWindow

Return