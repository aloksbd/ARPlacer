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
        
        let objectDistanceController = ObjectDistanceController(sceneView: sceneView)
        let presenter = ARPlacerInformationPresenter(informationView: controller, errorView: controller)
        let sceneDelegateWithPresenter = ARPlacerSessionDelegateWithPresenterAdapter(delegate: ARPlacerSessionDelegate(), presenter: presenter)
        let sceneViewDelegate = ARPlacerSessionDelegateWithObjetDistanceControllerAdapter(delegate: sceneDelegateWithPresenter, controller: objectDistanceController)
        
        sceneView.delegate = sceneViewDelegate
        injectSceneView(sceneView, toController: controller)
        
        let arPlacerSceneViewController = ARPlacerSceneViewController(sceneView: sceneView, objectPlacer: objectPlacer)
        let arPlacerSceneViewControllerDelegate = ARPlacerSceneViewControllerDelegateImpl(controller: objectDistanceController, presenter: presenter)
        arPlacerSceneViewController.delegate = arPlacerSceneViewControllerDelegate
        
        controller.sceneViewController = arPlacerSceneViewController
        return controller
    }
    
    private static func ARPlacerViewControllerFromStoryBoard() -> ARPlacerViewController {
        let bundle = Bundle(for: ARPlacerViewController.self)
        let storyboard = UIStoryboard(name: "ARPlacer", bundle: bundle)
        let controller = storyboard.instantiateInitialViewController() as! ARPlacerViewController
        return controller
    }
    
    private static func injectSceneView(_ sceneView: ARSCNView, toController controller: ARPlacerViewController) {
        controller.setSceneView = { view in
            sceneView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(sceneView)
            NSLayoutConstraint.activate([
                sceneView.topAnchor.constraint(equalTo: view.topAnchor),
                sceneView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                sceneView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                sceneView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
    }
}
