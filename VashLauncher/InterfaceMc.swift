//
//  InterfaceMc.swift
//  VashLauncher
//
//  Created by Serge Ivamov on 11.01.2022.
//

import Carbon

func runMc() {
    /*
    let script = """
on RunMc(Cmd, Theme, Cols, Rows)
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
end RunMc
"""
     */

    let path = Bundle.main.path(forResource: "RunMc", ofType: "scpt")
    let url = URL(fileURLWithPath: path!)
    let handler = NSAppleEventDescriptor(string: "RunMc")
    let prepcmd = prepRunMcCommand()
    let cmd = NSAppleEventDescriptor(string: prepcmd)
    let theme = NSAppleEventDescriptor(string: udefMcTermTheme_1)
    let cols = NSAppleEventDescriptor(string: udefMcTermCols_1)
    let rows = NSAppleEventDescriptor(string: udefMcTermRows_1)

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
} // runMc()

func prepRunMcCommand() -> String {

    var cmd = "exec bash -c '\n"
    if (udefMcEnvironment_1.isEmpty) {
        print("with empty environment")
    } else {
        print("with environment: \(udefMcEnvironment_1)")
        cmd.append("export \(udefMcEnvironment_1)\n")
    }
    if (UserDefaults.udefIsDebugLaunch) {
        print("with Debug ON")
    } else {
        print("with Debug OFF")
        cmd.append("clear\n")
    }
    cmd.append(udefMcCommand_1 + "\n'")
    if (UserDefaults.udefIsDebugLaunch) { print("cmd:\n----------\n\(cmd)\n----------\n") }
    return cmd
} // prepRunMcCommand
