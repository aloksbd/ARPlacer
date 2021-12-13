//
//  ObjectDistanceController.swift
//  ARPlacer
//
//  Created by alok subedi on 13/12/2021.
//

import UIKit
import ARKit

public class ObjectDistanceController {
    private var objectToLabel = [Object: UILabel]()
    private let sceneView: ARSCNView
    
    public init(sceneView: ARSCNView) {
        self.sceneView = sceneView
    }
    
    public func add(object: Object) {
        let label = Self.createLabel()
        sceneView.addSubview(label)
        objectToLabel[object] = label
    }
    
    public func update() {
        for (object, label) in self.objectToLabel {
            guard object.isSeen(in: sceneView) else {
                label.isHidden = true
                continue
            }
            label.isHidden = false
            updateLabel(label, for: object)
        }
    }
    
    private func updateLabel(_ label: UILabel, for object: Object) {
        guard let distance = object.distanceFromCamera(of: sceneView) else { return }
        let poistionInScreen = sceneView.projectPoint(object.worldPosition)
        label.text = "\(distance)"
        label.frame = CGRect(x: Int(poistionInScreen.x), y: Int(poistionInScreen.y), width: 50, height: 20)
    }
    
    private static func createLabel() -> UILabel {
        let label = UILabel()
        label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }
}
