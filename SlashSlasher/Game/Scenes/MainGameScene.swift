//
//  MainGameScene.swift
//  SlashSlasher
//
//  Created by Bruno Diniz on 09/05/2023.
//

import GameplayKit
import Combine

class MainGameScene: SKScene {
    // MARK: Properties
    
    private let gameLoop = GameLoop()
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: SKScene
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        delegate = gameLoop
        physicsWorld.contactDelegate = gameLoop
        physicsWorld.gravity = .zero
        
        view.showsNodeCount = true
        view.showsPhysics = true
        view.showsFPS = true
        view.showsDrawCount = true
        
        subscribe()
        gameLoop.start()
    }
    
    // MARK: Private methods
    
    private func subscribe() {
        gameLoop.nodes
            .sink { [unowned self] in addChild($0) }
            .store(in: &cancellables)
    }
    
}
