//
//  PhysicsComponent.swift
//  SlashSlasher
//
//  Created by Bruno Diniz on 10/05/2023.
//

import GameplayKit

class PhysicsComponent: GKComponent {
    // MARK: Properties
    
    let physicsBody: SKPhysicsBody
    
    // MARK: Init
    init(physicsBody: SKPhysicsBody, mask: PhysicsMask) {
        self.physicsBody = physicsBody

        physicsBody.categoryBitMask = mask.category
        physicsBody.collisionBitMask = mask.collision
        physicsBody.contactTestBitMask = mask.contactTest
        
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
