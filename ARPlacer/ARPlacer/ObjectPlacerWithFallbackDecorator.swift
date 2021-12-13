//
//  ObjectPlacerWithFallbackDecorator.swift
//  ARPlacer
//
//  Created by alok subedi on 13/12/2021.
//

import ARKit

public class ObjectPlacerWithFallbackDecorator: ObjectPlacer {
    let primary: ObjectPlacer
    let secondary: ObjectPlacer
    
    public init(primary: ObjectPlacer, secondary: ObjectPlacer) {
        self.primary = primary
        self.secondary = secondary
    }
    
    public func place(in sceneView: ARSCNView, at position: CGPoint) -> Object? {
        if let object = primary.place(in: sceneView, at: position) {
            return object
        } else {
            return secondary.place(in: sceneView, at: position)
        }
    }
}
