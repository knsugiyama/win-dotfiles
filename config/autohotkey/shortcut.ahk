#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; see https://note.com/ciderblues/n/n65c9b246b3c6

; 左右 Alt キーの空打ちで IME の OFF/ON を切り替える
;
; 左 Alt キーの空打ちで IME を「英数」に切り替え
; 右 Alt キーの空打ちで IME を「かな」に切り替え
; Alt キーを押している間に他のキーを打つと通常の Alt キーとして動作
;
; Author:     karakaram   http://www.karakaram.com/alt-ime-on-off

#Include IME.ahk

; Razer Synapseなど、キーカスタマイズ系のツールを併用しているときのエラー対策
#MaxHotkeysPerInterval 350

;IME変換で無効化したいキーにはfalseをセット
boolLAlt := true
boolLShift := true
boolRAlt := true
boolRShift := true
boolLCtrl := true

; 主要なキーを HotKey に設定し、何もせずパススルーする
*~a::
*~b::
*~c::
*~d::
*~e::
*~f::
*~g::
*~h::
*~i::
*~j::
*~k::
*~l::
*~m::
*~n::
*~o::
*~p::
*~q::
*~r::
*~s::
*~t::
*~u::
*~v::
*~w::
*~x::
*~y::
*~z::
*~1::
*~2::
*~3::
*~4::
*~5::
*~6::
*~7::
*~8::
*~9::
*~0::
*~F1::
*~F2::
*~F3::
*~F4::
*~F5::
*~F6::
*~F7::
*~F8::
*~F9::
*~F10::
*~F11::
*~F12::
*~`::
*~~::
*~!::
*~@::
*~#::
*~$::
*~%::
*~^::
*~&::
*~*::
*~(::
*~)::
*~-::
*~_::
*~=::
*~+::
*~[::
*~{::
*~]::
*~}::
*~\::
*~|::
*~;::
*~'::
*~"::
*~,::
*~<::
*~.::
*~>::
*~/::
*~?::
*~Esc::
*~Tab::
*~Space::
*~Left::
*~Right::
*~Up::
*~Down::
*~Enter::
*~PrintScreen::
*~Delete::
*~Home::
*~End::
*~PgUp::
*~PgDn::
    Return

; 上部メニューがアクティブになるのを抑制
*~LAlt::Send {Blind}{vkFF}
*~RAlt::Send {Blind}{vkFF}
*~LCtrl::Send {Blind}{vkFF}
*~RShift::Send {Blind}{vkFF}
*~LShift::Send {Blind}{vkFF}


; 左 Alt / 左 Sfhit 空打ちで IME を OFF
LAlt up::
LShift up::
	if (A_PriorHotkey = "*~LAlt" and boolLAlt ) or (A_PriorHotkey = "*~LShift" and boolLShift)
	{
		IME_SET(0)
	}
	Return

; 右 Alt  / 右 Sfhit 空打ちで IME を ON
RAlt up::
RShift up::
  if (A_PriorHotkey = "*~RAlt" and boolRAlt) or (A_PriorHotkey = "*~RShift" and boolRShift)
  {
		IME_SET(1)
  }
  Return
