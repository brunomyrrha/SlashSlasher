//
//  Camera.swift
//  SlashSlasher
//
//  Created by Bruno Diniz on 10/05/2023.
//

import Foundation

struct Camera {
    var position: SIMD3<Float>
    var eulers: SIMD3<Float>
    
    var forwards: SIMD3<Float>
    var right: SIMD3<Float>
    var up: SIMD3<Float>
    
    init(position: SIMD3<Float>, eulers: SIMD3<Float>) {
        self.position = position
        self.eulers = eulers
        self.forwards = .zero
        self.right = .zero
        self.up = .zero
    }
    
    mutating func updateVectors() {
        forwards = [
            cos(eulers[2] * .pi / 180.0) * sin(eulers[1] * .pi / 180.0),
            sin(eulers[2] * .pi / 180.0) * sin(eulers[1] * .pi / 180.0),
            cos(eulers[1] * .pi / 180.0)
        ]
        
        let globalUp = SIMD3<Float>(x: 0.0, y: 0.0, z: 1.0)
        
        right = simd.cross(globalUp, forwards)
        up = simd.cross(forwards, right)
    }
}
