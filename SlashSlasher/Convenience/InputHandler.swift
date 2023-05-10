//
//  InputHandler.swift
//  SlashSlasher
//
//  Created by Bruno Diniz on 10/05/2023.
//

import Foundation

class InputHandler {
    private init() { }
    static var instance = InputHandler()
    
    private var size = CGSize.zero
    
    private(set) var pinch = CGFloat(1.0)
    private(set) var destination = CGPoint(x: 1.0, y: 1.0)
    private(set) var location = CGPoint(x: 1.0, y: 1.0)
    
    func screenSize(_ size: CGSize) {
        self.size = size
    }
    
    func pinch(_ amount: CGFloat) {
        self.pinch = Math.clamp(min: 1.0, max: 5.0, value: pinch * amount)
        print(pinch)
    }
    
    func drag(start: CGPoint, destination: CGPoint) {
        let newDestination = CGPoint(x: destination.x, y: size.height - destination.y)
        self.destination = newDestination
        print(newDestination)
    }
    
    func tap(_ location: CGPoint) {
        let newDestination = CGPoint(x: location.x, y: size.height - location.y)
        self.destination = newDestination
        print(newDestination)
    }
}
