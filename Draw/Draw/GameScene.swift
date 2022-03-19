//
//  GameScene.swift
//  Draw
//
//  Created by Benjamin on 30/4/19.
//  Copyright © 2019 Benjamin. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var circle: SKShapeNode!
    var line: SKShapeNode!
    var lines = [SKShapeNode()]
    var deletedArray = [SKShapeNode()]
    var startPoint: CGPoint?
    var endPos: CGPoint?
    var squareEndPos: CGPoint?
    var lastPointArray = [CGPoint()]
    var deletedPointArray = [CGPoint()]
    var didMove = false
    var makeSquare = false
    var point = false
    
    override func didMove(to view: SKView) {
        view.allowsTransparency = true
    }
    override func update(_ currentTime: TimeInterval) {
        
    }
    override func mouseDown(with event: NSEvent) {
        self.touchDown(atPoint: event.location(in: self))
    }
    
    override func mouseDragged(with event: NSEvent) {
        self.touchMoved(toPoint: event.location(in: self))
    }
    
    override func mouseUp(with event: NSEvent) {
        self.touchUp(atPoint: event.location(in: self))
    }
    
    override func keyDown(with event: NSEvent) {
        if event.keyCode == UInt16(0x33) {
            self.removeAllChildren()
            lines.removeAll()
            deletedPointArray.removeAll()
            lastPointArray.removeAll()
            deletedPointArray.removeAll()
        }
        if event.keyCode == UInt16(0x06) {
            deleteLastLine()
        }
        if event.keyCode == UInt16(0x01) {
            makeSquare = toggle(toToggle: makeSquare)
        }
        if event.keyCode == UInt16(0x23) {
            point = toggle(toToggle: point)
        }
        if event.keyCode == UInt16(0x07) {
            recoverLastLine()
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        startPoint = pos
        line = SKShapeNode()
        line.strokeColor = SKColor.systemRed
        addChild(line)
    }

    func touchMoved(toPoint pos : CGPoint) {
        makeLine(atPoint: startPoint!, toPoint: pos)
        didMove = true
    }

    func touchUp(atPoint pos : CGPoint) {
        if !didMove {
            line.removeFromParent()
        }
        else {
            lines.append(line)
        }
        if (point && endPos != nil) && makeSquare {
            endPos = squareEndPos
        }
        else {
            endPos = pos
        }
        lastPointArray.append(endPos!)
        line = nil
        didMove = false
    }
    
    func recoverLastLine() {
        if let newLine = deletedArray.last {
            lines.append(newLine)
            addChild(newLine)
            deletedArray = deletedArray.dropLast(1)
        }
        if let newPoint = deletedPointArray.last {
            lastPointArray.append(newPoint)
            deletedPointArray = deletedPointArray.dropLast(1)
        }
    }
    
    func deleteLastLine() {
        if let lastLine = lines.last {
            deletedArray.append(lastLine)
            lastLine.removeFromParent()
            lines = lines.dropLast(1)
        }
        if let lastPoint = lastPointArray.last {
            deletedPointArray.append(lastPoint)
            lastPointArray = lastPointArray.dropLast(1)
        }
    }
    
    func makeLine(atPoint start: CGPoint, toPoint end: CGPoint) {
        let path = CGMutablePath()
        if point && endPos != nil && !lastPointArray.isEmpty {
            path.move(to: lastPointArray.last!)
        }
        else {
            path.move(to: start)
        }
        if makeSquare {
            path.addLine(to: square(toPoint: end))
        }
        else {
            path.addLine(to: end)
        }
        line.path = path
    }
    
    func square(toPoint end: CGPoint) -> CGPoint{
        if point && endPos != nil {
            startPoint = endPos
        }
        var xDif = startPoint!.x - end.x; if xDif < 0 { xDif *= -1 }
        var yDif = startPoint!.y - end.y; if yDif < 0 { yDif *= -1 }
        if yDif < xDif {
            squareEndPos = (CGPoint(x: end.x, y: startPoint!.y))
        }
        else {
            squareEndPos = (CGPoint(x: startPoint!.x, y: end.y))
        }
        return squareEndPos!
    }
    func toggle(toToggle: Bool) -> Bool {
        var toReturn: Bool = toToggle
        if toToggle {
            toReturn = false
        }
        else {
            toReturn = true
        }
        return toReturn
    }
}
