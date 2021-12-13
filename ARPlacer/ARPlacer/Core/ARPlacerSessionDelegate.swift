//
//  ARPlacerSessionDelegate.swift
//  ARPlacer
//
//  Created by alok subedi on 24/11/2021.
//

import ARKit

public class ARPlacerSessionDelegate: NSObject, ARSCNViewDelegate {
    public var sessionFailedWithError: ((String) -> Void)?
    public var onLimited: (() -> Void)?
    public var onNotAvailable: (() -> Void)?
    public var onNormal: (() -> Void)?
    
    public var update: (() -> Void)?
    
    public func session(_ session: ARSession, didFailWithError error: Error) {
        sessionFailedWithError?(error.localizedDescription)
    }
    
    public func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
        switch camera.trackingState {
        case .limited :
            onLimited?()
        case .notAvailable:
            onNotAvailable?()
        case .normal:
            onNormal?()
        }
    }
    
    public func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        update?()
    }
}
