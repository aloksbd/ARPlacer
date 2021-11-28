//
//  ARPlacerViewController.swift
//  ARPlacer
//
//  Created by alok subedi on 24/11/2021.
//

import UIKit
import SceneKit
import ARKit

public class ARPlacerViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet private(set) public var sceneView: ARSCNView!
    @IBOutlet private(set) public weak var textLabel: UILabel!
    
    var sceneViewController: ARPlacerSceneViewController!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}

extension ARPlacerViewController: InformationView {
    public func display(information: String) {
        textLabel.text = information
    }
}
