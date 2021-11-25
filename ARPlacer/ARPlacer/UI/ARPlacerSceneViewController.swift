//
//  ARPlacerSceneViewController.swift
//  ARPlacer
//
//  Created by alok subedi on 25/11/2021.
//

import ARKit

public class ARPlacerSceneViewController {
    private let sceneView: ARSCNView
    
    public init(sceneView: ARSCNView) {
        self.sceneView = sceneView
        addTapGestureRecognizer()
    }
    
    private func addTapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        sceneView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func tap(_ gesture: UITapGestureRecognizer) { }
}
