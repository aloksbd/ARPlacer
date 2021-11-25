//
//  ARPlacerSceneViewController.swift
//  ARPlacer
//
//  Created by alok subedi on 25/11/2021.
//

import ARKit

public protocol ObjectPlacer {
    func place(in position: CGPoint)
}

public class ARPlacerSceneViewController {
    private let sceneView: ARSCNView
    private let objectPlacer: ObjectPlacer
    
    public init(sceneView: ARSCNView, objectPlacer: ObjectPlacer) {
        self.sceneView = sceneView
        self.objectPlacer = objectPlacer
        addTapGestureRecognizer()
    }
    
    private func addTapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        sceneView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func tap(_ gesture: UITapGestureRecognizer) {
        let tappedPosition = gesture.location(in: sceneView)
        objectPlacer.place(in: tappedPosition)
    }
    
    func runSession() {
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    func pauseSession() {
        sceneView.session.pause()
    }
}
