//
//  ARPlacerSceneViewControllerDelegateImpl.swift
//  ARPlacer
//
//  Created by alok subedi on 13/12/2021.
//

public class ARPlacerSceneViewControllerDelegateImpl: ARPlacerSceneViewControllerDelegate {
    private let controller: ObjectDistanceController
    private let presenter: ARPlacerInformationPresenter
    
    public init(controller: ObjectDistanceController, presenter: ARPlacerInformationPresenter) {
        self.controller = controller
        self.presenter = presenter
    }
    
    public func cannotPlaceAnchor() {
        presenter.cannotPlaceObject()
    }
    
    public func placedObject(_ object: Object) {
        controller.add(object: object)
    }
}
