//
//  ARPlacerViewControllerComposer.swift
//  ARPlacer
//
//  Created by alok subedi on 28/11/2021.
//

import UIKit
import ARKit

public class ARPlacerViewControllerComposer {
    public static func composeWith(objectPlacer: ObjectPlacer, sceneView: ARSCNView) -> ARPlacerViewController {
        let controller = ARPlacerViewControllerFromStoryBoard()
        controller.setSceneView = { view in
            view = sceneView
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
