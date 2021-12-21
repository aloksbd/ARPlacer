//
//  HorizontalObjectPlacer.swift
//  ARPlacer
//
//  Created by alok subedi on 27/11/2021.
//

import ARKit

public class HorizontalObjectPlacer: ObjectPlacer {
    public init() { }
    
    public func place(in sceneView: ARSCNView, at position: CGPoint) -> Object? {
        guard let raycastQuery = sceneView.raycastQuery(from: position, allowing: .estimatedPlane, alignment: .horizontal),
              let raycastResult = sceneView.session.raycast(raycastQuery).first
        else { return nil }
        
        let object = RandomObjectCreator.create()
        object.position = raycastResult.position
        
        // to place node on surface of horizontal plane
        object.movePivotToBottomOfNode()
        sceneView.scene.rootNode.addChildNode(object)
        return object
    }
}
