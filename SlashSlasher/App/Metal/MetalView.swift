//
//  MetalView.swift
//  SlashSlasher
//
//  Created by Bruno Diniz on 09/05/2023.
//

import SwiftUI
import MetalKit

struct MetalView: UIViewRepresentable {
    
    func makeCoordinator() -> Renderer {
        Renderer(self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MetalView>) -> MTKView {
        let mtkView = MTKView()
        mtkView.delegate = context.coordinator
        mtkView.preferredFramesPerSecond = 60
        mtkView.enableSetNeedsDisplay = true
     
        if let metalDevice = MTLCreateSystemDefaultDevice() {
            mtkView.device = metalDevice
        }
        
        mtkView.framebufferOnly = false
        mtkView.drawableSize = mtkView.frame.size
        mtkView.isPaused = false
        
        return mtkView
    }
    
    func updateUIView(_ uiView: MTKView, context: UIViewRepresentableContext<MetalView>) {
        
    }
    
}

struct MetalView_Previews: PreviewProvider {
    static var previews: some View {
        MetalView()
    }
}
