//
//  GameSystem.swift
//  SlashSlasher
//
//  Created by Bruno Diniz on 10/05/2023.
//

import GameplayKit
import Combine

class GameSystem {
    
    var nodes: AnyPublisher<SKNode, Never> { _nodes.eraseToAnyPublisher() }
    private let _nodes = PassthroughSubject<SKNode, Never>()
    
}
