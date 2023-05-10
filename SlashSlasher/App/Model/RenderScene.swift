//
//  RenderScene.swift
//  SlashSlasher
//
//  Created by Bruno Diniz on 10/05/2023.
//

import Foundation

class RenderScene {
    
    private(set) var camera: Camera
    private(set) var triangles: [SimpleComponent]
    
    init() {
        camera = Camera(
            position: .init(x: 0.0, y: 0.0, z: 0.0),
            eulers: .init(x: 0.0, y: 90.0, z: 0.0)
        )
        
        triangles = [
            SimpleComponent(
                position: .init(x: 0.0, y: 0.0, z: 0.0),
                eulers: .init(x: 0.0, y: 0.0, z: 0.0)
            )
        ]
    }
    
    func update() {
        camera.updateVectors()
        
        for triangle in triangles {
            triangle.eulers.z += 1
            
            if triangle.eulers.z > 360 {
                triangle.eulers.z -= 360
            }
        }
    }
}
