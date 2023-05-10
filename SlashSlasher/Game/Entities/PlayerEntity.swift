//
//  PlayerEntity.swift
//  SlashSlasher
//
//  Created by Bruno Diniz on 10/05/2023.
//

import GameplayKit

class PlayerEntity: GKEntity {
    // MARK: Init
    
    var node: SKNode {
        component(ofType: RenderComponent.self)!.node
    }
    
    override init() {
        let sprite = SKSpriteNode(
            texture: nil,
            color: .blue,
            size: .init(width: 50, height: 50)
        )
        
        super.init()
        
        let render = RenderComponent()
        addComponent(render)
        
        let transform = TransformComponent()
        addComponent(transform)
        
        let physicsBody = SKPhysicsBody(rectangleOf: sprite.size)

        let physics = PhysicsComponent(physicsBody: physicsBody, mask: .Player)
        addComponent(physics)

        sprite.physicsBody = physics.physicsBody
        render.node.addChild(sprite)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}
