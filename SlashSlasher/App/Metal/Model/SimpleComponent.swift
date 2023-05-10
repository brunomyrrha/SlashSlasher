//
//  SimpleComponent.swift
//  SlashSlasher
//
//  Created by Bruno Diniz on 10/05/2023.
//

import Foundation

class SimpleComponent {
    var position: SIMD3<Float>
    var eulers: SIMD3<Float>
    
    init(position: SIMD3<Float>, eulers: SIMD3<Float>) {
        self.position = position
        self.eulers = eulers
    }
}
