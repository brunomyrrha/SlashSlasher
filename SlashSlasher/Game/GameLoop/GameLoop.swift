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
    
    func start() {
        let node = SKSpriteNode(texture: nil, color: .blue, size: .init(width: 20, height: 20))
        _nodes.send(node)
    }
}
