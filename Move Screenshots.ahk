; Move Screenshots v0.1.0

global screenshotsDir := "D:\MultiMC Screenshots" ; screenshot move to folder
global numInstances := 7
global MCDir := "C:\MultiInstance\MultiMC\instances\1.16.1INST#" ; the # signifies the instance number

; Hotkey::SSMove() ; Rewrite it to any hotkey if necessary
SSMove() ; It works just by launching ahk

SSMove(){
    Loop, %numInstances%{
        inst += 1
        SelectMCDir := InstDirChange(inst)

        MCSSDir = %SelectMCDir%\.minecraft\screenshots\*.png
        Loop, %MCSSDir%{
            Filename = %A_LoopFileName%
            FileMove, %MCSSDir%, %screenshotsDir%\Instance%inst%-%Filename%
        }
    }
}

InstDirChange(i){
    SplitPath, MCDir, filename, dir
    StringReplace, ChangedDir, filename, #, %i%
    dummy = %dir%\%ChangedDir%
    Return %dummy%
}