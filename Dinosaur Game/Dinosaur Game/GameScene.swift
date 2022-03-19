//
//  GameScene.swift
//  Dinosaur Game
//
//  Created by Benjamin on 5/4/19.
//  Copyright © 2019 Benjamin. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    let player = SKSpriteNode(imageNamed: "player")
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
        player.position = CGPoint(x: size.width * -0.4, y: size.height * 0)
        player.setScale(0.325)
        addChild(player)
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(createFloor),SKAction.wait(forDuration: 2)])))
    }
    
    override func keyDown(with event: NSEvent) {
        if event.keyCode == UInt16(0x31) {
            if event.type == .keyDown && event.isARepeat {
                return
            }
            else if player.position.y > 1 {
                return
            }
            let actionJump = SKAction.move(to: CGPoint(x: player.position.x, y: player.position.y + 100), duration: 0.45)
            let actionFall = SKAction.move(to: CGPoint(x: player.position.x, y: size.height * 0), duration: 0.45)
            player.run(SKAction.sequence([actionJump, actionFall]))
        }
    }
    
    override func update(_ currentTime: TimeInterval) {

    }
    
    func createFloor() {
        let floor = SKSpriteNode(imageNamed: "floor")
        let floor2 = floor.copy() as! SKSpriteNode
        let floor3 = floor.copy() as! SKSpriteNode
        floor.position = CGPoint(x: size.width * -0.2, y: size.height * -0.03)
        floor2.position = CGPoint(x: size.width * 0.396, y: size.height * -0.03)
        floor3.position = CGPoint(x: size.width * 0.796, y: size.height * -0.03)
        addChild(floor)
        addChild(floor2)
        addChild(floor3)
        let actionMove = SKAction.move(to: CGPoint(x: floor.position.x - 500, y: size.height * -0.03), duration: 2)
        let actionMove2 = SKAction.move(to: CGPoint(x: floor2.position.x - 500, y: size.height * -0.03), duration: 2)
        let actionMove3 = SKAction.move(to: CGPoint(x: floor3.position.x - 500, y: size.height * -0.03), duration: 2)
        let actionMoveDone = SKAction.removeFromParent()
        floor.run(SKAction.sequence([actionMove, actionMoveDone]))
        floor2.run(SKAction.sequence([actionMove2, actionMoveDone]))
        floor3.run(SKAction.sequence([actionMove3, actionMoveDone]))
    }
}
