//
//  PlayScene.swift
//  DrawLine
//
//  Created by xigk on 2016/10/29.
//  Copyright © 2016年 xigk. All rights reserved.
//

import Foundation

import SpriteKit
import GameplayKit

class PlayScene: SKScene {
    
    
    override func didMove(to view: SKView) {
        // 单点触摸
        self.view?.isMultipleTouchEnabled = false
        
        init6X6Image(irand: 8)
    }
    
    func init6X6Image(irand:Int) {
        print("6x6", irand)
        
        let foneStep = frame.width / 7
        let width2 = Int(frame.width/2)
        let oneStep = Int(foneStep)
        for i in 1...6 {
            for j in 1...6{
                let stype = String( arc4random_uniform(5)+1 )
                
                let sprite = SKSpriteNode(imageNamed: stype)
                self.addChild(sprite)
                sprite.position = CGPoint(x: -width2 + i * oneStep, y: -(oneStep*3) + j*90)
                
                sprite.setScale(0.8)
            }
        }
        print(frame.width, frame.height)

        
    }
    
    func touchDown(atPoint pos : CGPoint) {
        print("按下", pos)

    }
    
    func touchMoved(toPoint pos : CGPoint) {
        print("moved",pos)
    }
    
    func touchUp(atPoint pos : CGPoint) {
        print("弹起",pos)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches {
            self.touchDown(atPoint: t.location(in: self))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchMoved(toPoint: t.location(in: self))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchUp(atPoint: t.location(in: self))
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
//            self.touchUp(atPoint: t.location(in: self))
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

