//
//  VerticalObjectPlacer.swift
//  ARPlacer
//
//  Created by alok subedi on 27/11/2021.
//

import ARKit

public class VerticalObjectPlacer: ObjectPlacer {
    public init() { }
    
    public func place(in sceneView: ARSCNView, at position: CGPoint) -> Bool {
        guard let raycastQuery = raycastQuery(on: sceneView, from: position) else { return false }
        guard let raycastResult = firstRaycastQueryResult(from: raycastQuery, on: sceneView) else { return false }
        
        let node = RandomObjectCreator.create()
        
        // making sure object is placed on the vertical plane facing away from it.
        node.simdTransform = raycastResult.worldTransform
        
        // to place node on surface of vertical plane
        movePivotToBottomOfNode(node: node)
        sceneView.scene.rootNode.addChildNode(node)
        return true
    }
    
    private func raycastQuery(on sceneView: ARSCNView, from position: CGPoint) -> ARRaycastQuery? {
        return sceneView.raycastQuery(from: position, allowing: .estimatedPlane, alignment: .vertical)
    }
    
    private func firstRaycastQueryResult(from raycastQuery: ARRaycastQuery, on sceneView: ARSCNView) -> ARRaycastResult? {
        return sceneView.session.raycast(raycastQuery).first
    }
    
    private func movePivotToBottomOfNode(node: SCNNode) {
        let halfOfHeightOfNode = node.boundingBox.max.y
        node.pivot = SCNMatrix4MakeTranslation(0, -halfOfHeightOfNode, 0)
    }
}

