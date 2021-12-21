//
//  Object.swift
//  ARPlacer
//
//  Created by alok subedi on 03/12/2021.
//

import ARKit

public class Object: SCNNode {
    public convenience init(geometry: SCNGeometry) {
        self.init()
        self.geometry = geometry
    }
    
    public func isSeen(in sceneView: ARSCNView) -> Bool {
        if let pointOfView = sceneView.pointOfView {
            return sceneView.isNode(self, insideFrustumOf: pointOfView)
        } else {
            return false
        }
    }
    
    public func distanceFromCamera(of sceneView: ARSCNView) -> Float? {
        let position = simdTransform.columns.3
        guard let currentFrame = sceneView.session.currentFrame else { return nil }
        let cameraPosition = currentFrame.camera.transform.columns.3
        let distance = simd_distance(position, cameraPosition) * 100
        return round(distance * 10) / 10.0
    }
}
