; From https://discord.com/channels/763847972013342740/763855940742676500/924700430691336283  # winthemers Discord

#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

#SingleInstance Force
#NoTrayIcon

LWin & vk07::
KeyWait, LWin
if (A_PriorKey="LWin")
Send {Alt down}{Space}{Alt up}
return
LWin::
KeyWait, LWin
if (A_PriorKey="LWin")
Send {Alt down}{Space}{Alt up}
return

Alt & Tab::
Send {Alt down}{Space}{Alt up}w
return