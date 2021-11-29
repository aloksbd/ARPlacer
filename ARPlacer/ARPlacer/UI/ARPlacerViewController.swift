//
//  ARPlacerViewController.swift
//  ARPlacer
//
//  Created by alok subedi on 24/11/2021.
//

import UIKit

public class ARPlacerViewController: UIViewController {

    @IBOutlet private(set) public var sceneView: UIView!
    @IBOutlet private(set) public weak var textLabel: UILabel!
    
    // setting sceneView this way to keep using storyboard and inject sceneview
    public var setSceneView: ((inout UIView) -> Void)?
    
    public var sceneViewController: ARPlacerSceneViewController!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setSceneView?(&sceneView)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}

extension ARPlacerViewController: InformationView, ErrorView {
    public func display(error: String) {
        textLabel.isHidden = false
        textLabel.textColor = .systemRed
        textLabel.text = error
    }
    
    public func display(information: String) {
        textLabel.isHidden = false
        textLabel.textColor = .systemBackground
        textLabel.text = information
    }
}
