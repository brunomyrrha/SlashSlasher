//
//  PhysicsMask.swift
//  SlashSlasher
//
//  Created by Bruno Diniz on 10/05/2023.
//

import Foundation

struct PhysicsMask: OptionSet, Hashable {
    let rawValue: UInt32
    
    // MARK: - Configurations
    
    static var collisions = [PhysicsMask: [PhysicsMask]]()
    static var contacts = [PhysicsMask: [PhysicsMask]]()

    var category: UInt32 {
        rawValue
    }
    
    var collision: UInt32 {
        reduce(Self.collisions)
    }
    
    var contactTest: UInt32 {
        reduce(Self.contacts)
    }
    
    // MARK: - Public methods
    
    func notifyOnContactWith(_ physicsMask: PhysicsMask) -> Bool {
        Self.contacts[self]?.contains(physicsMask) ?? false
    }
    
    // MARK: - Private methods
    
    private func reduce(_ dictionary: [PhysicsMask: [PhysicsMask]]) -> UInt32 {
        dictionary[self]?.reduce(PhysicsMask()) { $0.union($1) }.rawValue ?? .zero
    }
}

// MARK: - Options

extension PhysicsMask {
    static var Player: Self { .init(rawValue: 1 << 0) }
    static var Enemy: Self { .init(rawValue: 1 << 1) }
    static var Obstacle: Self { .init(rawValue: 1 << 2) }
}
