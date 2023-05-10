//
//  MainView.swift
//  SlashSlasher
//
//  Created by Bruno Diniz on 10/05/2023.
//

import SwiftUI
import SpriteKit

struct MainView: View {
    
    @State private var pinchScale = CGFloat(1.0)
    @State private var dragAxis = CGPoint(x: 1.0, y: 1.0)
    
    private func gameScene(size: CGSize) -> SKScene {
        let gameScene = MainGameScene()
        gameScene.size = size
        gameScene.scaleMode = .resizeFill
        gameScene.backgroundColor = .clear
        
        InputHandler.instance.screenSize(size)
        
        return gameScene
    }
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                SpriteView(scene: gameScene(size: geo.size))
            }
            .padding(16)
            .background(Color.white.ignoresSafeArea())
        }
        .onTapGesture { location in
            InputHandler.instance.tap(location)
        }
        .gesture(DragGesture().onChanged { value in
            InputHandler.instance.drag(start: value.startLocation, destination: value.location)
        })
        .gesture(MagnificationGesture().onChanged { value in
            let delta = value / pinchScale
            pinchScale = value
            InputHandler.instance.pinch(delta)
        } .onEnded { _ in
            pinchScale = 1.0
        })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
