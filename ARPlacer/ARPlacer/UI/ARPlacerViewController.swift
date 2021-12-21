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
        sceneViewController.runSession()
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneViewController.pauseSession()
    }
}

extension ARPlacerViewController: InformationView, ErrorView {
    public func displayAndHide(information: String) {
        display(text: information, backgroundColor: .systemBackground)
        hideTextLabelAfter()
    }
    
    public func displayAndHide(error: String) {
        display(text: error, backgroundColor: .systemRed)
        hideTextLabelAfter()
    }
    
    public func display(error: String) {
        display(text: error, backgroundColor: .systemRed)
    }
    
    public func display(information: String) {
        display(text: information, backgroundColor: .systemBackground)
    }
    
    private func display(text: String, backgroundColor: UIColor) {
        textLabel.isHidden = false
        textLabel.textColor = backgroundColor
        textLabel.text = text
    }
    
    private func hideTextLabelAfter(duration: DispatchTime = .now() + 5) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.textLabel.isHidden = true
        }
    }
}
