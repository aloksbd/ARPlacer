//
//  RandomObjectCreator.swift
//  ARPlacer
//
//  Created by alok subedi on 25/11/2021.
//

import SceneKit

public class RandomObjectCreator {
    private(set) public static var randomNumberGenerator = { Int.random(in: 0...RandomObject.count) }
    
    public static func create(randomNumberGenerator: () -> Int = randomNumberGenerator) -> SCNNode {
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
        case .torus:
            return createTorus()
        }
    }
    
    private static func createSphere() -> SCNNode {
        let sphere = SCNSphere(radius: 0.05)
        giveRandomColor(geometry: sphere)
        return createNode(geometry: sphere)
    }
    
    private static func createBox() -> SCNNode {
        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        giveRandomColor(geometry: box)
        return createNode(geometry: box)
    }
    
    private static func createTorus() -> SCNNode {
        let torus = SCNTorus(ringRadius: 0.05, pipeRadius: 0.02)
        giveRandomColor(geometry: torus)
        return createNode(geometry: torus)
    }
    
    private static func createNode(geometry: SCNGeometry) -> Object {
        return Object(geometry: geometry)
    }
    
    private static func giveRandomColor(geometry: SCNGeometry) {
        let red = randomColorRatio()
        let green = randomColorRatio()
        let blue = randomColorRatio()
        let randomColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        geometry.firstMaterial?.diffuse.contents = randomColor
    }
    
    private static func randomColorRatio() -> CGFloat {
        return CGFloat(Int.random(in: 0...10))/10
    }
}
