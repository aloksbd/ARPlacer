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
    private var delegate: ARPlacerSceneViewControllerDelegateSpy?
    private var objectPlacer: ObjectPlacerSpy?
    
    override func setUp() {
        objectPlacer = ObjectPlacerSpy()
        sceneView = ARSCNView()
        delegate = ARPlacerSceneViewControllerDelegateSpy()
        sut = ARPlacerSceneViewController(sceneView: sceneView!, objectPlacer: objectPlacer!)
        sut?.delegate = delegate
    }
    
    override func tearDown() {
        objectPlacer = nil
        sceneView = nil
        delegate = nil
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
        delegate?.cannotPlaceAnchorCallback = {
            exp.fulfill()
        }
        sceneView?.simulateTap()
        objectPlacer?.simulateFailToPlaceObject()
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(objectPlacer?.callCount, 1)
    }
    
    func test_notifiesWithObjectPlacedOnTap() {
        let exp = expectation(description: "Wait for notification")
        let expectedObject = Object()
        delegate?.objectPlacedCallback = { receivedObject in
            XCTAssertEqual(expectedObject, receivedObject)
            exp.fulfill()
        }
        sceneView?.simulateTap()
        objectPlacer?.simulateObjectPlaced(object: expectedObject)
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(objectPlacer?.callCount, 1)
    }
    
    //MARK: Helpers
    
    private class ObjectPlacerSpy: ObjectPlacer {
        private(set) var callCount = 0
        private var placeObject: Object?
        
        var onPlaceCall: (() -> Void)?
        
        func place(in sceneView: ARSCNView, at position: CGPoint) -> Object? {
            callCount += 1
            onPlaceCall?()
            return placeObject
        }
        
        func simulateFailToPlaceObject() {
            placeObject = nil
        }
        
        func simulateObjectPlaced(object: Object) {
            placeObject = object
        }
    }
    
    private class ARPlacerSceneViewControllerDelegateSpy: ARPlacerSceneViewControllerDelegate {
        var cannotPlaceAnchorCallback: (() -> Void)?
        var objectPlacedCallback: ((Object) -> Void)?
        
        func cannotPlaceAnchor() {
            cannotPlaceAnchorCallback?()
        }
        
        func placedObject(_ object: Object) {
            objectPlacedCallback?(object)
        }
    }
}
