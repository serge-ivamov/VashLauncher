//
//  InterfacePwsh.swift
//  VashLauncher
//
//  Created by Serge Ivamov on 11.01.2022.
//

import Carbon

func runPwsh() {
    /*
    let script = """
on RunPwsh(Cmd, Theme, Cols, Rows)
    tell application "Terminal"
       if it is not running then
           set newTerm to do script Cmd in window 1
       else
           set newTerm to do script Cmd
       end if
       activate
       set newTerm's current settings to settings set Theme
       set number of columns of front window to Cols
       set number of rows of front window to Rows
   end tell
end RunPwsh
"""
     */

    let path = Bundle.main.path(forResource: "RunPwsh", ofType: "scpt")
    let url = URL(fileURLWithPath: path!)
    let handler = NSAppleEventDescriptor(string: "RunPwsh")
    let prepcmd = prepRunPwshCommand()
    let cmd = NSAppleEventDescriptor(string: prepcmd)
    let theme = NSAppleEventDescriptor(string: udefPwshTermTheme_1)
    let cols = NSAppleEventDescriptor(string: udefPwshTermCols_1)
    let rows = NSAppleEventDescriptor(string: udefPwshTermRows_1)

    let parameters = NSAppleEventDescriptor.list()
    parameters.insert(cmd, at: 0)
    parameters.insert(theme, at: 0)
    parameters.insert(cols, at: 0)
    parameters.insert(rows, at: 0)

    let event = NSAppleEventDescriptor(
        eventClass: AEEventClass(kASAppleScriptSuite),
        eventID: AEEventID(kASSubroutineEvent),
        targetDescriptor: nil,
        returnID: AEReturnID(kAutoGenerateReturnID),
        transactionID: AETransactionID(kAnyTransactionID)
    )
    event.setDescriptor(handler, forKeyword: AEKeyword(keyASSubroutineName))
    event.setDescriptor(parameters, forKeyword: AEKeyword(keyDirectObject))

    var error: NSDictionary?
//    if let appleScript = NSAppleScript(source: script) {
    if let appleScript = NSAppleScript(contentsOf: url, error: &error) {
        if let outputString = appleScript.executeAppleEvent(event, error: &error).stringValue {
            print("output: ", outputString)
        } else if (error != nil) {
            print("error: ", error!)
        }
    }
} // runPwsh()

func prepRunPwshCommand() -> String {


    var cmd = "exec bash -c '\n"
    if (udefPwshEnvironment_1.isEmpty) {
        print("with empty environment")
    } else {
        print("with environment: \(udefPwshEnvironment_1)")
        cmd.append("export \(udefPwshEnvironment_1)\n")
    }
    if (UserDefaults.udefIsDebugLaunch) {
        print("with Debug ON")
    } else {
        print("with Debug OFF")
        cmd.append("clear\n")
    }
    cmd.append(udefPwshCommand_1 + "\n'")
    if (UserDefaults.udefIsDebugLaunch) { print("cmd:\n----------\n\(cmd)\n----------\n") }
    return cmd
} // prepRunPwshCommand
