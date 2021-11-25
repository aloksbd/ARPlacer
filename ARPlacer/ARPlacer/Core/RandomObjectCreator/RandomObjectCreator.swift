//
//  RandomObjectCreator.swift
//  ARPlacer
//
//  Created by alok subedi on 25/11/2021.
//

import SceneKit

public class RandomObjectCreator {
    public static func create(randomNumberGenerator: () -> Int = { Int.random(in: 0...RandomObject.count) }) -> SCNNode {
        let randomNumber = randomNumberGenerator()
        guard let randomObject = RandomObject(rawValue: randomNumber) else { return SCNNode() }
        return createNode(for: randomObject)
    }
    
    private static func createNode(for randomObject: RandomObject) -> SCNNode {
        switch randomObject {
        case .sphere:
            return createSphere()
        case .box:
            return createBox()
        }
    }
    
    private static func createSphere() -> SCNNode {
        let sphere = SCNSphere(radius: 0.05)
        return createNode(geometry: sphere)
    }
    
    private static func createBox() -> SCNNode {
        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        return createNode(geometry: box)
    }
    
    private static func createNode(geometry: SCNGeometry) -> SCNNode {
        let node = SCNNode(geometry: geometry)
        return node
    }
}
