//
//  NonPlaneObjectPlacer.swift
//  ARPlacer
//
//  Created by alok subedi on 26/11/2021.
//

import ARKit

public class NonPlaneObjectPlacer: ObjectPlacer {
    public init() { }
    
    public func place(in sceneView: ARSCNView, at position: CGPoint) -> Object? {
        guard let raycastQuery = sceneView.raycastQuery(from: position, allowing: .estimatedPlane, alignment: .any),
              let raycastResult = sceneView.session.raycast(raycastQuery).first
        else { return nil }
        
        let object = RandomObjectCreator.create()
        object.position = raycastResult.position
        sceneView.scene.rootNode.addChildNode(object)
        return object
    }
}
