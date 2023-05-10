//
//  RenderComponent.swift
//  SlashSlasher
//
//  Created by Bruno Diniz on 10/05/2023.
//

import GameplayKit

class RenderComponent: GKComponent {
    // MARK: Properties
    
    let node = SKNode()
    
    // MARK: GKComponent
    override func didAddToEntity() {
        node.entity = entity
    }
    
    override func willRemoveFromEntity() {
        node.entity = nil
    }
}
