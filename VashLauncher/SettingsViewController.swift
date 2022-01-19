//
//  SettingsViewController.swift
//  VashLauncher
//
//  Created by Serge Ivamov on 10.01.2022.
//

import Cocoa
import KeyboardShortcuts

class SettingsViewController: NSViewController {

    @IBOutlet var VLversionLBL: NSTextField!
    @IBOutlet var settingsCancelPB: NSButton!
    @IBOutlet var settingsOkPB: NSButton!


    // vash tab
    @IBOutlet var vashGlobalHotkey_1: NSView!
    @IBOutlet var vashTermCols_1: NSTextField!
    @IBOutlet var vashTermRows_1: NSTextField!
    @IBOutlet var vashTermTheme_1: NSTextField!
    @IBOutlet var vashShowUsage_1: NSButton!
    @IBOutlet var vashMode_1: NSTextField!
    @IBOutlet var vashEnvironment_1: NSTextField!
    @IBOutlet var vashCommand_1: NSTextField!

    // mc tab
    @IBOutlet var mcGlobalHotkey_1: NSView!
    @IBOutlet var mcTermCols_1: NSTextField!
    @IBOutlet var mcTermRows_1: NSTextField!
    @IBOutlet var mcTermTheme_1: NSTextField!
    @IBOutlet var mcEnvironment_1: NSTextField!
    @IBOutlet var mcCommand_1: NSTextField!

    // pwsh tab
    @IBOutlet var pwshGlobalHotkey_1: NSView!
    @IBOutlet var pwshTermCols_1: NSTextFieldCell!
    @IBOutlet var pwshTermRows_1: NSTextFieldCell!
    @IBOutlet var pwshTermTheme_1: NSTextFieldCell!
    @IBOutlet var pwshEnvironment_1: NSTextFieldCell!
    @IBOutlet var pwshCommand_1: NSTextFieldCell!

    // shell tab
    @IBOutlet var shellGlobalHotkey_1: NSView!
    @IBOutlet var shellTermCols_1: NSTextField!
    @IBOutlet var shellTermRows_1: NSTextField!
    @IBOutlet var shellTermTheme_1: NSTextField!
    @IBOutlet var shellEnvironment_1: NSTextField!
    @IBOutlet var shellCommand_1: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.

        VLversionLBL.stringValue = VLVersion

        vashTermRows_1.stringValue = udefVashTermRows_1
        vashTermCols_1.stringValue = udefVashTermCols_1
        vashTermTheme_1.stringValue = udefVashTermTheme_1
        vashShowUsage_1.stringValue = udefVashShowUsage_1
        vashMode_1.stringValue = udefVashMode_1
        vashEnvironment_1.stringValue = udefVashEnvironment_1
        vashCommand_1.stringValue = udefVashCommand_1

        mcTermRows_1.stringValue = udefMcTermRows_1
        mcTermCols_1.stringValue = udefMcTermCols_1
        mcTermTheme_1.stringValue = udefMcTermTheme_1
        mcEnvironment_1.stringValue = udefMcEnvironment_1
        mcCommand_1.stringValue = udefMcCommand_1

        pwshTermRows_1.stringValue = udefPwshTermRows_1
        pwshTermCols_1.stringValue = udefPwshTermCols_1
        pwshTermTheme_1.stringValue = udefPwshTermTheme_1
        pwshEnvironment_1.stringValue = udefPwshEnvironment_1
        pwshCommand_1.stringValue = udefPwshCommand_1

        shellTermRows_1.stringValue = udefShellTermRows_1
        shellTermCols_1.stringValue = udefShellTermCols_1
        shellTermTheme_1.stringValue = udefShellTermTheme_1
        shellEnvironment_1.stringValue = udefShellEnvironment_1
        shellCommand_1.stringValue = udefShellCommand_1

        let recorderVash_1 = KeyboardShortcuts.RecorderCocoa(for: .toggleRunVash_1)
        vashGlobalHotkey_1.addSubview(recorderVash_1)

        let recorderMc_1 = KeyboardShortcuts.RecorderCocoa(for: .toggleRunMc_1)
        mcGlobalHotkey_1.addSubview(recorderMc_1)

        let recorderPswh_1 = KeyboardShortcuts.RecorderCocoa(for: .toggleRunPwsh_1)
        pwshGlobalHotkey_1.addSubview(recorderPswh_1)

        let recorderShell_1 = KeyboardShortcuts.RecorderCocoa(for: .toggleRunShell_1)
        shellGlobalHotkey_1.addSubview(recorderShell_1)

    }

    @IBAction func settingsCancelPBAction(_ sender: Any) {
        print("Settings cancelled…")
        vashTermRows_1.stringValue = udefVashTermRows_1
        vashTermCols_1.stringValue = udefVashTermCols_1
        vashTermTheme_1.stringValue = udefVashTermTheme_1
        vashShowUsage_1.stringValue = udefVashShowUsage_1
        vashMode_1.stringValue = udefVashMode_1
        vashEnvironment_1.stringValue = udefVashEnvironment_1
        vashCommand_1.stringValue = udefVashCommand_1

        mcTermRows_1.stringValue = udefMcTermRows_1
        mcTermCols_1.stringValue = udefMcTermCols_1
        mcTermTheme_1.stringValue = udefMcTermTheme_1
        mcEnvironment_1.stringValue = udefMcEnvironment_1
        mcCommand_1.stringValue = udefMcCommand_1

        pwshTermRows_1.stringValue = udefPwshTermRows_1
        pwshTermCols_1.stringValue = udefPwshTermCols_1
        pwshTermTheme_1.stringValue = udefPwshTermTheme_1
        pwshEnvironment_1.stringValue = udefPwshEnvironment_1
        pwshCommand_1.stringValue = udefPwshCommand_1

        menuClosePopover(sender: sender)
    }

    @IBAction func settingsOkPBAction(_ sender: Any) {
        print("Ok…")
        udefVashTermRows_1 = vashTermRows_1.stringValue
        udefVashTermCols_1 = vashTermCols_1.stringValue
        udefVashTermTheme_1 = vashTermTheme_1.stringValue
        udefVashShowUsage_1 = vashShowUsage_1.stringValue
        udefVashMode_1 = vashMode_1.stringValue
        udefVashEnvironment_1 = vashEnvironment_1.stringValue
        udefVashCommand_1 = vashCommand_1.stringValue

        udefMcTermRows_1 = mcTermRows_1.stringValue
        udefMcTermCols_1 = mcTermCols_1.stringValue
        udefMcTermTheme_1 = mcTermTheme_1.stringValue
        udefMcEnvironment_1 = mcEnvironment_1.stringValue
        udefMcCommand_1 = mcCommand_1.stringValue

        udefPwshTermRows_1 = pwshTermRows_1.stringValue
        udefPwshTermCols_1 = pwshTermCols_1.stringValue
        udefPwshTermTheme_1 = pwshTermTheme_1.stringValue
        udefPwshEnvironment_1 = pwshEnvironment_1.stringValue
        udefPwshCommand_1 = pwshCommand_1.stringValue

        SaveSettings()

        menuClosePopover(sender: sender)
    }
}

extension SettingsViewController {
    static func freshController() -> SettingsViewController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier("SettingsViewController")
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? SettingsViewController else {
            fatalError("Can't find SettingsViewController - Check Main.storyboard")
        }
        return viewcontroller
    }
}
