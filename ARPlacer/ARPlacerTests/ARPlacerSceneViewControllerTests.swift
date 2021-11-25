//
//  ARPlacerSceneViewControllerTests.swift
//  ARPlacerTests
//
//  Created by alok subedi on 25/11/2021.
//

import XCTest
import ARPlacer
import ARKit

class ARPlacerSceneViewControllerTests: XCTestCase {
    func test_addTapGestureRecognizerOnInit() {
        let sceneView = ARSCNView()
        let _ = ARPlacerSceneViewController(sceneView: sceneView)
        
        // ARSCNView has existing gestureRecognizers. Make sure new recognizer is added.
        XCTAssertEqual(sceneView.gestureRecognizers?.count, ARSCNView.defaultGestureRecognizers + 1)
    }
}

private extension ARSCNView {
    static var defaultGestureRecognizers: Int {
        let newInstance = ARSCNView()
        return newInstance.gestureRecognizers?.count ?? 0
    }
}
