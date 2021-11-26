//
//  HorizontalObjectPlacer.swift
//  ARPlacer
//
//  Created by alok subedi on 27/11/2021.
//

import ARKit

public class HorizontalObjectPlacer: ObjectPlacer {
    public func place(in sceneView: ARSCNView, at position: CGPoint) -> Bool {
        guard let raycastQuery = raycastQuery(on: sceneView, from: position) else { return false }
        guard let raycastResult = firstRaycastQueryResult(from: raycastQuery, on: sceneView) else { return false }
        
        let node = RandomObjectCreator.create()
        node.position = raycastPositionOnARWorld(raycastResult: raycastResult)
        sceneView.scene.rootNode.addChildNode(node)
        return true
    }
    
    private func raycastQuery(on sceneView: ARSCNView, from position: CGPoint) -> ARRaycastQuery? {
        return sceneView.raycastQuery(from: position, allowing: .estimatedPlane, alignment: .horizontal)
    }
    
    private func firstRaycastQueryResult(from raycastQuery: ARRaycastQuery, on sceneView: ARSCNView) -> ARRaycastResult? {
        return sceneView.session.raycast(raycastQuery).first
    }
    
    private func raycastPositionOnARWorld(raycastResult: ARRaycastResult) -> SCNVector3 {
        let raycastPosition = raycastResult.worldTransform.columns.3
        return SCNVector3(raycastPosition.x, raycastPosition.y, raycastPosition.z)
    }
}
