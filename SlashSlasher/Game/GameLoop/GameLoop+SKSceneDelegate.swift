//
//  GameLoop+SKSceneDelegate.swift
//  SlashSlasher
//
//  Created by Bruno Diniz on 10/05/2023.
//

import GameplayKit

extension GameLoop: SKSceneDelegate {
    func update(_ currentTime: TimeInterval, for scene: SKScene) {
        Time.update(currentTime)
    }
    
    func didEvaluateActions(for scene: SKScene) {
        
    }
    
    func didSimulatePhysics(for scene: SKScene) {
        
    }
    
    func didFinishUpdate(for scene: SKScene) {
        
    }
}
