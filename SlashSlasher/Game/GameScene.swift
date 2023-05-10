//
//  GameScene.swift
//  SlashSlasher
//
//  Created by Bruno Diniz on 09/05/2023.
//

import GameplayKit
import Combine

class GameScene: SKScene {
    
    private let sceneDelegate = SceneDelegate()
    private let contactDelegate = ContactDelegate()
    private let gameSystem = GameSystem()
    private var cancellables = Set<AnyCancellable>()
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        delegate = sceneDelegate
        physicsWorld.contactDelegate = contactDelegate
        
        subscribe()
    }
    
    private func subscribe() {
        gameSystem.nodes
            .sink { [unowned self] in addChild($0) }
            .store(in: &cancellables)
    }
    
}
