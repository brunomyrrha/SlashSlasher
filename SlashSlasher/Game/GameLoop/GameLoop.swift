//
//  GameLoop.swift
//  SlashSlasher
//
//  Created by Bruno Diniz on 10/05/2023.
//

import GameplayKit
import Combine

class GameLoop: NSObject {
    // MARK: Properties
    
    var nodes: AnyPublisher<SKNode, Never> { _nodes.eraseToAnyPublisher() }
    private let _nodes = PassthroughSubject<SKNode, Never>()
    
    let camera = SKCameraNode()
    let entity = PlayerEntity()
    
    // MARK: Public properties
    
    func start() {
        
        _nodes.send(camera)
        _nodes.send(entity.node)
    }
}
