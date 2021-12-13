//
//  ARPlacerSceneViewController.swift
//  ARPlacer
//
//  Created by alok subedi on 25/11/2021.
//

import ARKit

public protocol ARPlacerSceneViewControllerDelegate {
    func cannotPlaceAnchor()
    func placedObject(_ object: Object)
}

public class ARPlacerSceneViewController {
    private let sceneView: ARSCNView
    
    // storing delegate as it is optional in sceneView and gets deinit immediately
    private var sceneViewDelegate: ARSCNViewDelegate?
    private let objectPlacer: ObjectPlacer
    
    public var delegate: ARPlacerSceneViewControllerDelegate!
    
    public init(sceneView: ARSCNView, objectPlacer: ObjectPlacer) {
        self.sceneView = sceneView
        self.objectPlacer = objectPlacer
        self.sceneViewDelegate = sceneView.delegate
        addTapGestureRecognizer()
    }
    
    private func addTapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        sceneView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func tap(_ gesture: UITapGestureRecognizer) {
        let tappedPosition = gesture.location(in: sceneView)
        guard let object = objectPlacer.place(in: sceneView, at: tappedPosition) else {
            delegate.cannotPlaceAnchor()
            return
        }
        delegate.placedObject(object)
    }
    
    func runSession() {
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    func pauseSession() {
        sceneView.session.pause()
    }
}
