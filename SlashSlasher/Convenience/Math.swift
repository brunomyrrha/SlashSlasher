//
//  Math.swift
//  SlashSlasher
//
//  Created by Bruno Diniz on 10/05/2023.
//

import Foundation

enum Math {
    
    static func lerp<T: FloatingPoint>(min: T, max: T, by interpolation: T) -> T {
        if interpolation <= T(0) { return min }
        if interpolation >= T(1) { return max }
        return min + (max - min) * interpolation
    }
    
    static func inverseLerp<T: FloatingPoint>(min: T, max: T, position: T) -> T {
        let inverse = (position - min) / (max - min)
        return clamp(min: min, max: max, value: inverse)
    }
    
    static func clamp<T: FloatingPoint>(min: T, max: T, value: T) -> T {
        if value < min { return min }
        if value > max { return max }
        return value
    }
    
    static func lerp<S: SIMDScalar & FloatingPoint>(min: SIMD2<S>, max: SIMD2<S>, by interpolation: S) -> SIMD2<S> {
        let x = lerp(min: min.x, max: max.x, by: interpolation)
        let y = lerp(min: min.y, max: max.y, by: interpolation)
        return SIMD2<S>(x: x, y: y)
    }
    
    static func lerp<S: SIMDScalar & FloatingPoint>(min: SIMD3<S>, max: SIMD3<S>, by interpolation: S) -> SIMD3<S> {
        let x = lerp(min: min.x, max: max.x, by: interpolation)
        let y = lerp(min: min.y, max: max.y, by: interpolation)
        let z = lerp(min: min.z, max: max.z, by: interpolation)
        return SIMD3<S>(x: x, y: y, z: z)
    }
}
