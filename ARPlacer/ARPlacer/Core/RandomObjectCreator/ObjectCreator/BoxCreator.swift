//
//  BoxCreator.swift
//  ARPlacer
//
//  Created by alok on 21/12/2021.
//

import SceneKit

public class BoxCreator: ObjectCreator {
    public func create() -> Object {
        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        box.firstMaterial?.diffuse.contents = UIColor.randomColor()
        return Object(geometry: box)
    }
}
