//
//  VerticalObjectPlacer.swift
//  ARPlacer
//
//  Created by alok subedi on 27/11/2021.
//

import ARKit

public class VerticalObjectPlacer: ObjectPlacer {
    public init() { }
    
    public func place(in sceneView: ARSCNView, at position: CGPoint) -> Object? {
        guard let raycastQuery = sceneView.raycastQuery(from: position, allowing: .estimatedPlane, alignment: .vertical),
              let raycastResult = sceneView.session.raycast(raycastQuery).first
        else { return nil }
        
        let object = RandomObjectCreator.create()
        
        // making sure object is placed on the vertical plane facing away from it.
        object.simdTransform = raycastResult.worldTransform
        
        // to place node on surface of vertical plane
        object.movePivotToBottomOfNode()
        sceneView.scene.rootNode.addChildNode(object)
        return object
    }
}
