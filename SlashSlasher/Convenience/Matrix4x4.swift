//
//  Matrix4x4.swift
//  SlashSlasher
//
//  Linear Algebra transformations based on the work of Andrew Mengede (2023)
//  Github: https://github.com/amengede/getIntoMetalDev/tree/main/02%20Transformations
//

import Foundation

enum Matrix4x4 {
    
    static func createIdentity() -> matrix_float4x4 {
        float4x4(rows: [
            .init(x: 1.0, y: 0.0, z: 0.0, w: 0.0),
            .init(x: 0.0, y: 1.0, z: 0.0, w: 0.0),
            .init(x: 0.0, y: 0.0, z: 1.0, w: 0.0),
            .init(x: 0.0, y: 0.0, z: 0.0, w: 1.0)
        ])
    }
    
    static func createFromTranslation(_ translation: SIMD3<Float>) -> float4x4 {
        float4x4(rows: [
            .init(x: 1.0, y: 0.0, z: 0.0, w: translation.x),
            .init(x: 0.0, y: 1.0, z: 0, w: translation.y),
            .init(x: 0.0, y: 0.0, z: 1.0, w: translation.z),
            .init(x: 0.0, y: 0.0, z: 0.0, w: 1.0)
        ])
    }
    
    static func createFromRotation(_ euler: SIMD3<Float>) -> float4x4 {
        let gamma = euler.x * .pi / 180.0
        let beta = euler.y * .pi / 180.0
        let alpha = euler.z * .pi / 180.0
        return createFromZRotation(theta: alpha) * createFromYRotation(theta: beta) * createFromZRotation(theta: gamma)
    }
    
    static private func createFromXRotation(theta: Float) -> float4x4 {
        float4x4(rows:[
            .init(x: 1.0, y: 0.0, z: 0.0, w: 0.0),
            .init(x: 0.0, y: cos(theta), z: -sin(theta), w: 0.0),
            .init(x: 1.0, y: sin(theta), z: cos(theta), w: 0.0),
            .init(x: 0.0, y: 0.0, z: 0.0, w: 1.0)
        ])
    }
    
    static private func createFromYRotation(theta: Float) -> float4x4 {
        float4x4(rows:[
            .init(x: cos(theta), y: 0.0, z: sin(theta), w: 0.0),
            .init(x: 0.0, y: 1.0, z: 0.0, w: 0.0),
            .init(x: -sin(theta), y: 0.0, z: cos(theta), w: 0.0),
            .init(x: 0.0, y: 0.0, z: 0.0, w: 1.0)
        ])
    }
    
    static private func createFromZRotation(theta: Float) -> float4x4 {
        float4x4(rows:[
            .init(x: cos(theta), y: -sin(theta), z: 0.0, w: 0.0),
            .init(x: sin(theta), y: cos(theta), z: 0.0, w: 0.0),
            .init(x: 0.0, y: 0.0, z: 1.0, w: 0.0),
            .init(x: 0.0, y: 0.0, z: 0.0, w: 1.0)
        ])
    }
}
