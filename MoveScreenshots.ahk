; Move Screenshots v0.2.0

; Settings
global screenshotsDir := "D:\MultiMC Screenshots" ; screenshot move to folder
global numInstances := 7
global MCDir := "C:\MultiInstance\MultiMC\instances\1.16.1INST#" ; the # signifies the instance number
global MessageBox := False

; Hotkey::SSMove() ; Rewrite it to any hotkey if necessary
SSMove() ; It works just by launching ahk

SSMove(){
    items := 0
    Loop, %numInstances%{
        instnum += 1
        SelectMCDir := InstDirChange(instnum)


        MCSSDir = %SelectMCDir%\.minecraft\screenshots\*.png
        Loop, %MCSSDir%{
            Filename = %A_LoopFileName%
            FileMove, %MCSSDir%, %screenshotsDir%\Instance %instnum%-%Filename%
            items += 1
        }
    }
    If (MessageBox = True)
        MsgBox, Moved %items% Items.
}

InstDirChange(i){
    SplitPath, MCDir, filename, dir
    StringReplace, ChangedDir, filename, #, %i%
    dummy = %dir%\%ChangedDir%
    Return %dummy%
}