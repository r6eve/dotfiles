; PowerToys: setxkbmap -option ctrl:swapcaps

; numbers <-> symbols
$1::SendRaw,!
$2::SendRaw,@
$3::SendRaw,#
$4::SendRaw,$
$5::SendRaw,`%
$6::SendRaw,^
$7::SendRaw,&
$8::SendRaw,*
$9::SendRaw,(
$0::SendRaw,)
$+1::SendRaw,1
$+2::SendRaw,2
$+3::SendRaw,3
$+4::SendRaw,4
$+5::SendRaw,5
$+6::SendRaw,6
$+7::SendRaw,7
$+8::SendRaw,8
$+9::SendRaw,9
$+0::SendRaw,0

LWin & Tab::AltTab
LWin & h::ShiftAltTab

F9::Send,{Volume_Mute}
F10::Send,{Volume_Down 1}
F11::Send,{Volume_Up 1}

; Switch Input Methods
^m::Send,#{Space}
