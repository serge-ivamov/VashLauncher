//
//  InterfaceVash.swift
//  VashLauncher
//
//  Created by Serge Ivamov on 11.01.2022.
//

import Carbon

func locateVashPathInApp() -> String {
    if (udefVashCommand_1 == "exec vash") {
        let bundledVash =  Bundle.main.resourcePath.map { "\($0)/vash/bin/vash" } ?? ""
        if (FileManager.default.fileExists(atPath: bundledVash)) {
            return "exec \(bundledVash)"
        }
    }
    return udefVashCommand_1
} // locateVashPathInApp()

func runVash() {
    /*
    let script = """
on RunVash(Cmd, Theme, Cols, Rows)
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
end RunVash
"""
     */
    let path = Bundle.main.path(forResource: "RunVash", ofType: "scpt")
    let url = URL(fileURLWithPath: path!)
    let handler = NSAppleEventDescriptor(string: "RunVash")
    let prepcmd = prepRunVashCommand()
    let cmd = NSAppleEventDescriptor(string: prepcmd)
    let theme = NSAppleEventDescriptor(string: udefVashTermTheme_1)
    let cols = NSAppleEventDescriptor(string: udefVashTermCols_1)
    let rows = NSAppleEventDescriptor(string: udefVashTermRows_1)

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
} // runVash()

func prepRunVashCommand() -> String {

    var cmd = "exec bash -c '\n"
    if (udefVashMode_1.isEmpty) {
        print("with empty VASH mode")
        cmd.append("unset VASH\n")
    } else {
        print("VASH mode: \(udefVashMode_1)")
        cmd.append("export VASH=\(udefVashMode_1)\n")
    }
    if (udefVashShowUsage_1 == "0") {
        print("Show usage: NO")
        cmd.append("export VASH_NOSHOWUSAGE=\n")
    } else {
        print("Show usage: YES")
        cmd.append("unset VASH_NOSHOWUSAGE\n")
    }
    if (udefVashEnvironment_1.isEmpty) {
        print("with empty environment")
    } else {
        print("with environment: \(udefVashEnvironment_1)")
        cmd.append("export \(udefVashEnvironment_1)\n")
    }
    if (UserDefaults.udefIsDebugLaunch) {
        print("with Debug ON")
    } else {
        print("with Debug OFF")
        cmd.append("clear\n")
    }

    cmd.append(locateVashPathInApp() + "\n'")
    if (UserDefaults.udefIsDebugLaunch) {
        print("cmd:\n----------\n\(cmd)\n----------\n")
    }
        return cmd
} // prepRunVashCommand
