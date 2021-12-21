//
//  SphereCreator.swift
//  ARPlacer
//
//  Created by alok on 21/12/2021.
//

import SceneKit

public class SphereCreator: ObjectCreator {
    public func create() -> Object {
        let sphere = SCNSphere(radius: 0.05)
        sphere.firstMaterial?.diffuse.contents = UIColor.randomColor()
        return Object(geometry: sphere)
    }
}
