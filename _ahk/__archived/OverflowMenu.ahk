; From https://github.com/khanhas/Polybar/blob/master/%40Resources/AHK%20Source%20File/ActivateTray.ahk

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#SingleInstance Force
#NoTrayIcon

DetectHiddenWindows, On

#b::

Send #b{Enter}

Return
