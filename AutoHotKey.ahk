; PowerToys: setxkbmap -option ctrl:swapcaps

; numbers <-> symbols
$1::Send "{Raw}!"
$2::Send "{Raw}@"
$3::Send "{Raw}#"
$4::Send "{Raw}$"
$5::Send "{Raw}%"
$6::Send "{Raw}^"
$7::Send "{Raw}&"
$8::Send "{Raw}*"
$9::Send "{Raw}("
$0::Send "{Raw})"
$+1::Send "{Raw}1"
$+2::Send "{Raw}2"
$+3::Send "{Raw}3"
$+4::Send "{Raw}4"
$+5::Send "{Raw}5"
$+6::Send "{Raw}6"
$+7::Send "{Raw}7"
$+8::Send "{Raw}8"
$+9::Send "{Raw}9"
$+0::Send "{Raw}0"

LWin & f::AltTab
LWin & b::ShiftAltTab

F9::Send "{Volume_Mute}"
F10::Send "{Volume_Down 1}"
F11::Send "{Volume_Up 1}"

; Switch Input Methods
^m::Send "#{Space}"
