//
//  AppDelegate.swift
//  VashLauncher
//
//  Created by Serge Ivamov on 09.01.2022.
//

import Cocoa
import KeyboardShortcuts
import LaunchAtLogin

let VLVersion = "ver: 1.0.0"

let popover = NSPopover()
let statusBarItemName = "VL"

let menu = NSMenu()
let menuItems: [String] = ["vash", "mc", "pwsh", "shell"]

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var statusItem: NSStatusItem!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application

        LoadSettings()

        //        let s = KeyboardShortcuts.Shortcut(KeyboardShortcuts.Key.f19)
        //        KeyboardShortcuts.setShortcut(s, for: .toggleRunVash_1)

        //        let sc = "{\"carbonModifiers\":4608,\"carbonKeyCode\":53}" // ctrl-shift-esc
        //        let decoded = try? JSONDecoder().decode(KeyboardShortcuts.Shortcut.self, from: Data(sc.utf8))
        //        KeyboardShortcuts.setShortcut(decoded, for: .toggleRunVash_1)

        KeyboardShortcuts.onKeyUp(for: .toggleRunVash_1) { runVash() }
        KeyboardShortcuts.onKeyUp(for: .toggleRunMc_1)   { runMc() }
        KeyboardShortcuts.onKeyUp(for: .toggleRunPwsh_1) { runPwsh() }

        // Create the settings view.
        popover.contentViewController = SettingsViewController.freshController()

        // Create the StatusBar menu item.
        addStatusBarItem()

    } // applicationDidFinishLaunching()

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
        print("Exiting app…")
    } // applicationWillTerminate()

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    } // applicationSupportsSecureRestorableState()

    func addStatusBarItem() {
        statusItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        statusItem.button?.title = statusBarItemName

        let shared = NSApplication.shared
        let sel: [Selector] = [#selector(menuRunVash), #selector(menuRunMc), #selector(menuRunPwsh), #selector(menuRunShell)]
        for i in 0..<menuItems.count {
            menu.addItem(NSMenuItem(title: menuItems[i], action: sel[i], keyEquivalent: ""))
        }
        menu.addItem(NSMenuItem.separator())
        let debugMenu = NSMenuItem(title: "Debug", action: #selector(menuToggleDebugState(_:)), keyEquivalent: "")
        if UserDefaults.udefIsDebugLaunch {
            debugMenu.state = NSControl.StateValue.on
        } else {
            debugMenu.state = NSControl.StateValue.off
        }
        menu.addItem(debugMenu)
        menu.addItem(NSMenuItem.separator())
        let autoStartMenu = NSMenuItem(title: "Autostart", action: #selector(menuToggleAutostartState(_:)), keyEquivalent: "")
        if UserDefaults.udefIsAutostart {
            autoStartMenu.state = NSControl.StateValue.on
        } else {
            autoStartMenu.state = NSControl.StateValue.off
        }
        menu.addItem(autoStartMenu)
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Settings", action: #selector(menuTogglePopover(_:)), keyEquivalent: ""))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(shared.terminate), keyEquivalent: ""))
        UpdateStatusBarMenus()
        statusItem.menu = menu
    } // addStatusBarItem()

    @objc func menuToggleDebugState(_ sender: NSMenuItem) {
        // sender.state = sender.state == NSControl.StateValue.on ? NSControl.StateValue.off : NSControl.StateValue.on
        if (UserDefaults.udefIsDebugLaunch) {
            sender.state = NSControl.StateValue.off
            UserDefaults.udefIsDebugLaunch = false
            print("Debug launch off")
        } else {
            sender.state = NSControl.StateValue.on
            UserDefaults.udefIsDebugLaunch = true
            print("Debug launch on")
        }
   } // menuToggleDebugState()

    @objc func menuToggleAutostartState(_ sender: NSMenuItem) {
        // sender.state = sender.state == NSControl.StateValue.on ? NSControl.StateValue.off : NSControl.StateValue.on
        if (UserDefaults.udefIsAutostart) {
            sender.state = NSControl.StateValue.off
            UserDefaults.udefIsAutostart = false
            LaunchAtLogin.isEnabled = false
            print("Autostart off")
        } else {
            sender.state = NSControl.StateValue.on
            UserDefaults.udefIsAutostart = true
            LaunchAtLogin.isEnabled = true
            print("Autostart on")
        }
    } // menuToggleAutostartState()

    @objc func menuTogglePopover(_ sender: Any?) {
        if popover.isShown {
            menuClosePopover(sender: sender)
        } else {
            menuShowPopover(sender: sender)
        }
    } // menuTogglePopover

    func menuShowPopover(sender: Any?) {
        if let button = statusItem.button {
            print("Open Settings…")
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    } // menuShowPopover

    @objc func menuRunVash() {
        print("Running vash…")
        runVash()
    } // menuRunVash

    @objc func menuRunMc() {
        print("Running mc…")
        runMc()
    } // menuRunMc()

    @objc func menuRunPwsh() {
        print("Running pwsh…")
        runPwsh()
    } // menuRunPwsh()

    @objc func menuRunShell() {
        print("Running shell…")
        runShell()
    } // menuRunShell()

} // AppDelegate.class

func menuClosePopover(sender: Any?) {
    print("Close Settings…")
    UpdateStatusBarMenus()
    popover.performClose(sender)
} // menuClosePopover()

