//
//  AppDelegate.swift
//  Draw
//
//  Created by Benjamin on 30/4/19.
//  Copyright © 2019 Benjamin. All rights reserved.
//


import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var item: NSStatusItem? = nil
    var logo = NSImage(imageLiteralResourceName: "Logo")
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        item = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        item?.button?.image = logo
        
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Hide", action: #selector(AppDelegate.hideMe), keyEquivalent: "h"))
        menu.addItem(NSMenuItem(title: "Show", action: #selector(AppDelegate.showMe), keyEquivalent: "s"))
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(AppDelegate.quitMe), keyEquivalent: "q"))
        item?.menu = menu
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        
    }
    
    @objc func hideMe() {
        NSApplication.shared.hide(self)
    }
    
    @objc func showMe() {
        NSApplication.shared.unhide(self)
        NSApplication.shared.activate(ignoringOtherApps: true)
    }
    
    @objc func quitMe() {
        NSApplication.shared.terminate(self)
    }
}
