//
//  SpinComponent.swift
//  Actividad 3
//
//  Created by Roberto Daniel Ramos Flores on 21/06/26.
//

import RealityKit

/// A component that spins the entity around a given axis.
struct SpinComponent: Component {
    let spinAxis: SIMD3<Float> = [0, 1, 0]
}
