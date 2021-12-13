//
//  ARPlacerSessionDelegateWithObjetDistanceControllerAdapter.swift
//  ARPlacer
//
//  Created by alok subedi on 13/12/2021.
//

import ARKit 

public class ARPlacerSessionDelegateWithObjetDistanceControllerAdapter: ARPlacerSessionDelegate {
    private var delegate: ARPlacerSessionDelegate!
    private var controller: ObjectDistanceController!
    
    override init() {
        super.init()
    }
    
    public convenience init(delegate: ARPlacerSessionDelegate, controller: ObjectDistanceController) {
        self.init()
        self.delegate = delegate
        self.controller = controller
        adaptToController()
    }
    
    private func adaptToController() {
        delegate.update = { [weak self] in
            DispatchQueue.main.async {
                self?.controller.update()
            }
        }
    }
    
    public override func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
        self.delegate.session(session, cameraDidChangeTrackingState: camera)
    }
    
    public override func session(_ session: ARSession, didFailWithError error: Error) {
        self.delegate.session(session, didFailWithError: error)
    }
    
    public override func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        self.delegate.renderer(renderer, updateAtTime: time)
    }
}

