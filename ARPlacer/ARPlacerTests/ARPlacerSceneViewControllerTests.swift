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
    private var sut: ARPlacerSceneViewController?
    private var sceneView: ARSCNView?
    private var objectPlacer: ObjectPlacerSpy?
    
    override func setUp() {
        objectPlacer = ObjectPlacerSpy()
        sceneView = ARSCNView()
        sut = ARPlacerSceneViewController(sceneView: sceneView!, objectPlacer: objectPlacer!)
    }
    
    override func tearDown() {
        objectPlacer = nil
        sceneView = nil
        sut = nil
    }
    
    func test_addTapGestureRecognizerOnInit() {
        // ARSCNView has existing gestureRecognizers. Make sure new recognizer is added.
        XCTAssertEqual(sceneView?.gestureRecognizers?.count, ARSCNView.defaultGestureRecognizers + 1)
    }
    
    func test_callsPlaceMethodInObjectPlacerOnTap() {
        XCTAssertEqual(objectPlacer?.callCount, 0)
        
        let exp = expectation(description: "Wait for place method call")
    
        // tap simulation runs asynchronously, so we fulfill the expectation when place(in:) is called
        objectPlacer?.onPlaceCall = {
            exp.fulfill()
        }
        sceneView?.simulateTap()
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(objectPlacer?.callCount, 1)
    }
    
    func test_notifiesIfObjectCouldNotBePlacedOnTap() {
        let exp = expectation(description: "Wait for notification")
        sut?.cannotPlaceAnchor = {
            exp.fulfill()
        }
        sceneView?.simulateTap()
        objectPlacer?.simulateFailToPlaceObject()
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(objectPlacer?.callCount, 1)
    }
    
    //MARK: Helpers
    
    private class ObjectPlacerSpy: ObjectPlacer {
        private(set) var callCount = 0
        private var placeObject = true
        
        var onPlaceCall: (() -> Void)?
        
        func place(in sceneView: ARSCNView, at position: CGPoint) -> Bool {
            callCount += 1
            onPlaceCall?()
            return placeObject
        }
        
        func simulateFailToPlaceObject() {
            placeObject = false
        }
    }
}
