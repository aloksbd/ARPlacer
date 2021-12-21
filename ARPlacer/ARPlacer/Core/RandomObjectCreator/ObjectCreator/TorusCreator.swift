//
//  TorusCreator.swift
//  ARPlacer
//
//  Created by alok on 21/12/2021.
//

import SceneKit

public class TorusCreator: ObjectCreator {
    public func create() -> Object {
        let torus = SCNTorus(ringRadius: 0.05, pipeRadius: 0.02)
        torus.firstMaterial?.diffuse.contents = UIColor.randomColor()
        return Object(geometry: torus)
    }
}
