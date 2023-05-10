//
//  Time.swift
//  SlashSlasher
//
//  Created by Bruno Diniz on 10/05/2023.
//

import Foundation

final class Time {
    
    private(set) static var deltaTime: TimeInterval = .zero
    
    private static var currentInterval: TimeInterval = .zero
    
    static func update(_ currentTime: TimeInterval) {
        if currentInterval.isZero {
            currentInterval = currentTime
            return
        }
        
        deltaTime = currentTime - currentInterval
        currentInterval = currentTime
    }
    
}
