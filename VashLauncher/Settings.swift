//
//  Settings.swift
//  VashLauncher
//
//  Created by Serge Ivamov on 12.01.2022.
//

import Cocoa
import KeyboardShortcuts

var udefVashTermCols_1 = ""
var udefVashTermRows_1 = ""
var udefVashTermTheme_1 = ""
var udefVashShowUsage_1 = ""
var udefVashMode_1 = ""
var udefVashEnvironment_1 = ""
var udefVashCommand_1 = ""

var udefMcTermCols_1 = ""
var udefMcTermRows_1 = ""
var udefMcTermTheme_1 = ""
var udefMcEnvironment_1 = ""
var udefMcCommand_1 = ""

var udefPwshTermCols_1 = ""
var udefPwshTermRows_1 = ""
var udefPwshTermTheme_1 = ""
var udefPwshEnvironment_1 = ""
var udefPwshCommand_1 = ""

var udefShellTermCols_1 = ""
var udefShellTermRows_1 = ""
var udefShellTermTheme_1 = ""
var udefShellEnvironment_1 = ""
var udefShellCommand_1 = ""

func UpdateStatusBarMenus() {
    let hkvash1 = KeyboardShortcuts.getShortcut(for: .toggleRunVash_1).map { "\($0)" } ?? ""
    let hkmc1 = KeyboardShortcuts.getShortcut(for: .toggleRunMc_1).map { "\($0)" } ?? ""
    let hkpwsh1 = KeyboardShortcuts.getShortcut(for: .toggleRunPwsh_1).map { "\($0)" } ?? ""
    let hkshell1 = KeyboardShortcuts.getShortcut(for: .toggleRunShell_1).map { "\($0)" } ?? ""
    let hkeys: [String] = [hkvash1, hkmc1, hkpwsh1, hkshell1]
    for i in 0..<menuItems.count {
        menu.item(at: i)?.title = menuItems[i] + "   " + hkeys[i]
    }
} // UpdateStatusBarMenus()

func LoadSettings() {
    udefVashTermCols_1 = UserDefaults.udefVashTermCols_1
    udefVashTermRows_1 = UserDefaults.udefVashTermRows_1
    udefVashTermTheme_1 = UserDefaults.udefVashTermTheme_1
    udefVashShowUsage_1 = UserDefaults.udefVashShowUsage_1
    udefVashMode_1 = UserDefaults.udefVashMode_1
    udefVashEnvironment_1 = UserDefaults.udefVashEnvironment_1
    udefVashCommand_1 = UserDefaults.udefVashCommand_1

    udefMcTermCols_1 = UserDefaults.udefMcTermCols_1
    udefMcTermRows_1 = UserDefaults.udefMcTermRows_1
    udefMcTermTheme_1 = UserDefaults.udefMcTermTheme_1
    udefMcEnvironment_1 = UserDefaults.udefMcEnvironment_1
    udefMcCommand_1 = UserDefaults.udefMcCommand_1

    udefPwshTermCols_1 = UserDefaults.udefPwshTermCols_1
    udefPwshTermRows_1 = UserDefaults.udefPwshTermRows_1
    udefPwshTermTheme_1 = UserDefaults.udefPwshTermTheme_1
    udefPwshEnvironment_1 = UserDefaults.udefPwshEnvironment_1
    udefPwshCommand_1 = UserDefaults.udefPwshCommand_1

    udefShellTermCols_1 = UserDefaults.udefShellTermCols_1
    udefShellTermRows_1 = UserDefaults.udefShellTermRows_1
    udefShellTermTheme_1 = UserDefaults.udefShellTermTheme_1
    udefShellEnvironment_1 = UserDefaults.udefShellEnvironment_1
    udefShellCommand_1 = UserDefaults.udefShellCommand_1

    print("Settings loaded from UserDefaults.")
} // LoadSettings()

func SaveSettings() {
    UserDefaults.udefVashTermCols_1 = udefVashTermCols_1
    UserDefaults.udefVashTermRows_1 = udefVashTermRows_1
    UserDefaults.udefVashTermTheme_1 = udefVashTermTheme_1
    UserDefaults.udefVashShowUsage_1 = udefVashShowUsage_1
    UserDefaults.udefVashMode_1 = udefVashMode_1
    UserDefaults.udefVashEnvironment_1 = udefVashEnvironment_1
    UserDefaults.udefVashCommand_1 = udefVashCommand_1

    UserDefaults.udefMcTermCols_1 = udefMcTermCols_1
    UserDefaults.udefMcTermRows_1 = udefMcTermRows_1
    UserDefaults.udefMcTermTheme_1 = udefMcTermTheme_1
    UserDefaults.udefMcEnvironment_1 = udefMcEnvironment_1
    UserDefaults.udefMcCommand_1 = udefMcCommand_1

    UserDefaults.udefPwshTermCols_1 = udefPwshTermCols_1
    UserDefaults.udefPwshTermRows_1 = udefPwshTermRows_1
    UserDefaults.udefPwshTermTheme_1 = udefPwshTermTheme_1
    UserDefaults.udefPwshEnvironment_1 = udefPwshEnvironment_1
    UserDefaults.udefPwshCommand_1 = udefPwshCommand_1

    UserDefaults.udefShellTermCols_1 = udefShellTermCols_1
    UserDefaults.udefShellTermRows_1 = udefShellTermRows_1
    UserDefaults.udefShellTermTheme_1 = udefShellTermTheme_1
    UserDefaults.udefShellEnvironment_1 = udefShellEnvironment_1
    UserDefaults.udefShellCommand_1 = udefShellCommand_1

    print("Settings saved to UserDefaults.")
} // SaveSettings()

extension UserDefaults {
    @UserDefault(key: "udefIsDebugLaunch", defaultValue: false)
    static var udefIsDebugLaunch: Bool
    @UserDefault(key: "udefIsAutostart", defaultValue: false)
    static var udefIsAutostart: Bool

    @UserDefault(key: "udefVashTermCols_1", defaultValue: "80")
    static var udefVashTermCols_1: String
    @UserDefault(key: "udefVashTermRows_1", defaultValue: "24")
    static var udefVashTermRows_1: String
    @UserDefault(key: "udefVashTermTheme_1", defaultValue: "basic")
    static var udefVashTermTheme_1: String
    @UserDefault(key: "udefVashShowUsage_1", defaultValue: "1")
    static var udefVashShowUsage_1: String
    @UserDefault(key: "udefVashMode_1", defaultValue: "l10shwSPWp")
    static var udefVashMode_1: String
    @UserDefault(key: "udefVashEnvironment_1", defaultValue: "somevar=someval")
    static var udefVashEnvironment_1: String
    @UserDefault(key: "udefVashCommand_1", defaultValue: "exec vash")
    static var udefVashCommand_1: String

    @UserDefault(key: "udefMcTermCols_1", defaultValue: "80")
    static var udefMcTermCols_1: String
    @UserDefault(key: "udefMcTermRows_1", defaultValue: "24")
    static var udefMcTermRows_1: String
    @UserDefault(key: "udefMcTermTheme_1", defaultValue: "ocean")
    static var udefMcTermTheme_1: String
    @UserDefault(key: "udefMcEnvironment_1", defaultValue: "somevar=someval")
    static var udefMcEnvironment_1: String
    @UserDefault(key: "udefMcCommand_1", defaultValue: "exec mc")
    static var udefMcCommand_1: String

    @UserDefault(key: "udefPwshTermCols_1", defaultValue: "80")
    static var udefPwshTermCols_1: String
    @UserDefault(key: "udefPwshTermRows_1", defaultValue: "24")
    static var udefPwshTermRows_1: String
    @UserDefault(key: "udefPwshTermTheme_1", defaultValue: "pro")
    static var udefPwshTermTheme_1: String
    @UserDefault(key: "udefPwshEnvironment_1", defaultValue: "somevar=someval")
    static var udefPwshEnvironment_1: String
    @UserDefault(key: "udefPwshCommand_1", defaultValue: "exec pwsh")
    static var udefPwshCommand_1: String

    @UserDefault(key: "udefShellTermCols_1", defaultValue: "80")
    static var udefShellTermCols_1: String
    @UserDefault(key: "udefShellTermRows_1", defaultValue: "24")
    static var udefShellTermRows_1: String
    @UserDefault(key: "udefShellTermTheme_1", defaultValue: "basic")
    static var udefShellTermTheme_1: String
    @UserDefault(key: "udefShellEnvironment_1", defaultValue: "somevar=someval")
    static var udefShellEnvironment_1: String
    @UserDefault(key: "udefShellCommand_1", defaultValue: "exec $SHELL")
    static var udefShellCommand_1: String
} // UserDefaults.extension
