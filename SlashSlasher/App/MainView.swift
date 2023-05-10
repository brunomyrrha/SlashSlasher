//
//  MainView.swift
//  SlashSlasher
//
//  Created by Bruno Diniz on 09/05/2023.
//

import SwiftUI
import SpriteKit

struct MainView: View {
    
    private func gameScene(size: CGSize) -> SKScene {
        print(size)
        let gameScene = GameScene()
        gameScene.size = size
        gameScene.scaleMode = .resizeFill
        gameScene.backgroundColor = .clear
        
        return gameScene
    }
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                SpriteView(scene: gameScene(size: geo.size))
                    .ignoresSafeArea()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
