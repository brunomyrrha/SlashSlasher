//
//  TransformComponent.swift
//  SlashSlasher
//
//  Created by Bruno Diniz on 10/05/2023.
//

import GameplayKit

class TransformComponent: GKComponent {
    // MARK: Properties
    
    var position: SIMD2<Double> = .zero
    var rotation: Double = .zero
    var scale: SIMD2<Double> = .zero
}
