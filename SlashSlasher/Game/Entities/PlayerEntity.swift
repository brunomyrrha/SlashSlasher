//
//  PlayerEntity.swift
//  SlashSlasher
//
//  Created by Bruno Diniz on 10/05/2023.
//

import GameplayKit

class PlayerEntity: GKEntity {
    // MARK: Init
    
    override init() {
        super.init()
        
        let render = RenderComponent()
        addComponent(render)
        
        let transform = TransformComponent()
        addComponent(transform)
        
        let physicsBody = SKPhysicsBody(rectangleOf: .init(width: 20, height: 20))

        let physics = PhysicsComponent(physicsBody: physicsBody, mask: .Player)
        addComponent(physics)

        render.node.physicsBody = physics.physicsBody
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}
