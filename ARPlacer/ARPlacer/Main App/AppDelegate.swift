//
//  AppDelegate.swift
//  ARPlacer
//
//  Created by alok subedi on 24/11/2021.
//

import UIKit
import ARKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let objectPlacer = createObjectPlacer()
        let viewController = ARPlacerViewControllerComposer.composeWith(objectPlacer: objectPlacer)
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    private func createObjectPlacer() -> ObjectPlacer {
        let horizontalToVerticalObjectPlacer = ObjectPlacerWithFallbackDecorator(primary: HorizontalObjectPlacer(), secondary: VerticalObjectPlacer())
        let horizontalToVerticalToNonPlaneObjectPlacer = ObjectPlacerWithFallbackDecorator(primary: horizontalToVerticalObjectPlacer, secondary: NonPlaneObjectPlacer())
        return horizontalToVerticalToNonPlaneObjectPlacer
    }
}

