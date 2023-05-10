//
//  TriangleMesh.swift
//  SlashSlasher
//
//  Created by Bruno Diniz on 10/05/2023.
//

import MetalKit

struct TriangleMesh {
    
    let buffer: MTLBuffer
    
    init(device: MTLDevice) {
        
        let vertices = [
            Vertex(position: [-1, -1], color: [1,0,0,1]),
            Vertex(position: [1, -1], color: [0,1,0,1]),
            Vertex(position: [0, 1], color: [0,0,1,1])
        ]
        
        buffer = device.makeBuffer(bytes: vertices, length: vertices.count * MemoryLayout<Vertex>.stride, options: [])!
    }
    
}
