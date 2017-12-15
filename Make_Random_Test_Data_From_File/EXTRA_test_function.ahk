;Best viewed in Notepad++ with the AHK syntax file installed.
;This file runs through AutoHotkey a highly versatile freeware scripting program.
;
; AutoHotkey Version: 1.1.26.1
; Language:       English
; Platform:       Windows 10
; Author:         staid03
; Version   Date        Author       Comments
;     0.1   15-DEC-17   staid03      Initial
;
; Script Function:
;    Test function to make random data from a pre-made text file list
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance , force

#Include %A_ScriptDir%\Function_Create_Test_Data_From_File.ahk

input_file = EXTRA_Robots_and_androids_from_Sci_Fi.txt
; Above input file was data verified that it fit the format of:
; ItemOne |tab| ItemTwo
; Which is necessary to have some kind of way to split the row
; if there is more than one item in the row.

data_start_line = 4
data_finish_line = 95

; Main
{
	; Get random data from file
	test_data_output := GetRandomTestData(input_file, data_start_line, data_finish_line)
	
	; Example use cases:
	showFullRow(test_data_output)
	showItemOne(test_data_output)
	showItemTwo(test_data_output)
	gosub , showMultipleItemOnes
}
Exit

showFullRow(test_data)
{
	MsgBox ,,, Full row:`n%test_data%
	
	Return 
}

showItemOne(test_data)
{
	StringSplit , item , test_data , %a_tab%
	MsgBox ,,, Item One`n[Robot/Android/Computer]: "%item1%"
	
	Return 
}

showItemTwo(test_data)
{
	StringSplit , item , test_data , %a_tab%
	MsgBox ,,, Item Two`n[Source]: "%item2%"
	
	Return 
}

showMultipleItemOnes:
{
	Gui , Add, ListView, r20 w700 , --------------Item One List--------------
	
	loop , 10		; Get list of 10 random items
	{
		test_data_output := GetRandomTestData(input_file, data_start_line, data_finish_line)
		StringSplit , item , test_data_output , %a_tab%
		list_item = %a_index%) %item1%
		LV_Add("", list_item)
	}
	
	Gui , Show
	
	Return
}
