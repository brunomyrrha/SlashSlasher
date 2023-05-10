//
//  GameLoop+SKSceneDelegate.swift
//  SlashSlasher
//
//  Created by Bruno Diniz on 10/05/2023.
//

import GameplayKit

extension GameLoop: SKSceneDelegate {
    // MARK: Public properties
    
    func update(_ currentTime: TimeInterval, for scene: SKScene) {
        Time.update(currentTime)
    }
    
    func didEvaluateActions(for scene: SKScene) {
        entity.node.position = InputHandler.instance.destination
        entity.node.xScale = InputHandler.instance.pinch
        entity.node.yScale = InputHandler.instance.pinch
    }
    
    func didSimulatePhysics(for scene: SKScene) {
        
    }
    
    func didFinishUpdate(for scene: SKScene) {
        
    }
}
