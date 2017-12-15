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
;    Function to make random data from a pre-made text file list
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance , force

GetRandomTestData(input_file, min_number , max_number)
{
	random , random_line_number , %min_number% , %max_number%
	filereadline , result_returned , %input_file% , %random_line_number%
	;msgbox ,,, input_file = %input_file%`nmin_number = %min_number%`nmax_number = %max_number%
	return %result_returned%
}