//
//  ViewController.swift
//  Draw
//
//  Created by Benjamin on 30/4/19.
//  Copyright © 2019 Benjamin. All rights reserved.
//

import Cocoa
import SpriteKit
import GameplayKit

class ViewController: NSViewController {

    @IBOutlet var skView: SKView!
    

    override func viewWillAppear() {
        super.viewWillAppear()
        view.window?.titlebarAppearsTransparent = true
        view.window?.isOpaque = false
        view.window?.backgroundColor = NSColor(red: 0, green: 0, blue: 0, alpha: 0)
    }
    override func viewDidAppear() {
        let presOptions: NSApplication.PresentationOptions = ([.fullScreen,.autoHideMenuBar])
        let optionsDictionary = [NSView.FullScreenModeOptionKey.fullScreenModeApplicationPresentationOptions :
            NSNumber(value: Int(presOptions.rawValue))]
        self.view.enterFullScreenMode(NSScreen.main!, withOptions:optionsDictionary)
        self.view.wantsLayer = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.skView {

            if let scene = SKScene(fileNamed: "GameScene") {

                scene.scaleMode = .aspectFill
                scene.backgroundColor = NSColor.clear
                view.presentScene(scene)
            }

            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
}

