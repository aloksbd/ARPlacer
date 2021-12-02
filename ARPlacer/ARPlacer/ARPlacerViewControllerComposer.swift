//
//  ARPlacerViewControllerComposer.swift
//  ARPlacer
//
//  Created by alok subedi on 28/11/2021.
//

import UIKit
import ARKit

public class ARPlacerViewControllerComposer {
    public static func composeWith(objectPlacer: ObjectPlacer, sceneView: ARSCNView = ARSCNView()) -> ARPlacerViewController {
        let controller = ARPlacerViewControllerFromStoryBoard()
        
        let delegate = ARPlacerSessionDelegateWithPresenterAdapter(delegate: ARPlacerSessionDelegate(), presenter: ARPlacerInformationPresenter(informationView: controller, errorView: controller))
        
        sceneView.delegate = delegate
        controller.setSceneView = { view in
            let v = sceneView
            v.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(v)
            NSLayoutConstraint.activate([
                v.topAnchor.constraint(equalTo: view.topAnchor),
                v.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                v.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                v.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
        
        let arPlacerSceneViewController = ARPlacerSceneViewController(sceneView: sceneView, objectPlacer: objectPlacer)
        controller.sceneViewController = arPlacerSceneViewController
        return controller
    }
    
    private static func ARPlacerViewControllerFromStoryBoard() -> ARPlacerViewController {
        let bundle = Bundle(for: ARPlacerViewController.self)
        let storyboard = UIStoryboard(name: "ARPlacer", bundle: bundle)
        let controller = storyboard.instantiateInitialViewController() as! ARPlacerViewController
        return controller
    }
}
