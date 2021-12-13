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
        guard let raycastQuery = raycastQuery(on: sceneView, from: position) else { return nil }
        guard let raycastResult = firstRaycastQueryResult(from: raycastQuery, on: sceneView) else { return nil }
        
        let object = RandomObjectCreator.create()
        object.position = raycastPositionOnARWorld(raycastResult: raycastResult)
        sceneView.scene.rootNode.addChildNode(object)
        return object
    }
    
    private func raycastQuery(on sceneView: ARSCNView, from position: CGPoint) -> ARRaycastQuery? {
        return sceneView.raycastQuery(from: position, allowing: .estimatedPlane, alignment: .any)
    }
    
    private func firstRaycastQueryResult(from raycastQuery: ARRaycastQuery, on sceneView: ARSCNView) -> ARRaycastResult? {
        return sceneView.session.raycast(raycastQuery).first
    }
    
    private func raycastPositionOnARWorld(raycastResult: ARRaycastResult) -> SCNVector3 {
        let raycastPosition = raycastResult.worldTransform.columns.3
        return SCNVector3(raycastPosition.x, raycastPosition.y, raycastPosition.z)
    }
}
