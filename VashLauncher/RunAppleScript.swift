//
//  RunInTerminal.swift
//  VashLauncher
//
//  Created by Serge Ivamov on 09.01.2022.
//

import Carbon

func runDisplayMessage() {
    let script = """
on displayMessage(message)
    display dialog message
    return "hello…"
end displayMessage
"""

    let handler = NSAppleEventDescriptor(string: "displayMessage")
    let message = NSAppleEventDescriptor(string: "Hello AppleScript!")

    let parameters = NSAppleEventDescriptor.list()
    parameters.insert(message, at: 0)

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
    if let appleScript = NSAppleScript(source: script) {
        if let outputString = appleScript.executeAppleEvent(event, error: &error).stringValue {
            print("output: ", outputString)
        } else if (error != nil) {
            print("error: ", error!)
        }
    }
} // runDisplayMessage()
