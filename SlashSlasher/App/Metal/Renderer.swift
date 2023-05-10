//
//  Renderer.swift
//  SlashSlasher
//
//  Created by Bruno Diniz on 10/05/2023.
//

import MetalKit

class Renderer: NSObject, MTKViewDelegate {
    
    private let parent: MetalView
    private var metalDevice: MTLDevice!
    private var metalCommandQueue: MTLCommandQueue!
    private var pipelineState: MTLRenderPipelineState
    private var scene: RenderScene
    private let mesh: TriangleMesh
    
    init(_ parent: MetalView) {
        self.parent = parent
        
        if let metalDevice = MTLCreateSystemDefaultDevice() {
            self.metalDevice = metalDevice
        }
        
        self.metalCommandQueue = metalDevice.makeCommandQueue()
        
        let library = metalDevice.makeDefaultLibrary()

        let pipelineDescriptor = MTLRenderPipelineDescriptor()
        pipelineDescriptor.vertexFunction = library?.makeFunction(name: "vertexShader")
        pipelineDescriptor.fragmentFunction = library?.makeFunction(name: "fragmentShader")
        pipelineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        
        self.pipelineState = try! metalDevice.makeRenderPipelineState(descriptor: pipelineDescriptor)
        
        self.mesh = TriangleMesh(device: metalDevice)
        self.scene = RenderScene()
        
        super.init()
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        
    }
    
    func draw(in view: MTKView) {
        
        scene.update()
        
        guard let drawable = view.currentDrawable else { return }
        
        let commandBuffer = metalCommandQueue.makeCommandBuffer()
        
        let renderPassDescriptor = view.currentRenderPassDescriptor
        renderPassDescriptor?.colorAttachments[0].clearColor = MTLClearColorMake(0, 0.5, 0.5, 1.0)
        renderPassDescriptor?.colorAttachments[0].loadAction = .clear
        renderPassDescriptor?.colorAttachments[0].storeAction = .store
        
        let renderEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor!)
        
        scene.triangles.forEach {
            var modelMatrix = Matrix4x4.createFromRotation($0.eulers)
            modelMatrix *= Matrix4x4.createFromTranslation($0.position)
            
            renderEncoder?.setVertexBytes(&modelMatrix, length: MemoryLayout<matrix_float4x4>.stride, index: 1)
            
            renderEncoder?.setRenderPipelineState(pipelineState)
            renderEncoder?.setVertexBuffer(mesh.buffer, offset: 0, index: 0)
            renderEncoder?.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: 3)
        }
        
        renderEncoder?.endEncoding()
        
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
    
}
