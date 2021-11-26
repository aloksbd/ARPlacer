//
//  ObjectPlacer.swift
//  ARPlacer
//
//  Created by alok subedi on 26/11/2021.
//

import ARKit

public protocol ObjectPlacer {
    func place(in sceneView: ARSCNView, at position: CGPoint) -> Bool
}
