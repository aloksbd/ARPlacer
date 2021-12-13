//
//  ARPlacerViewControllerIntegrationTest.swift
//  ARPlacerTests
//
//  Created by alok subedi on 28/11/2021.
//

import XCTest
import ARPlacer
import ARKit

// How to test informations being displayed????
// When session starts and camera tracking changes

class ARPlacerViewControllerIntegrationTest: XCTestCase {
    func test_sceneViewIsSetOnViewDidLoad() {
        let sceneView = ARSCNView()
        let sut = makeSUT(with: sceneView)
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.sceneView.subviews.first, sceneView)
    }
    
    func test_textLabelIsHiddenOnViewDidLoad() {
        let sut = makeSUT()
        
        sut.loadViewIfNeeded()
        
        XCTAssertTrue(sut.textLabel.isHidden)
    }
    
    // MARK: Helpers
    
    private func makeSUT(with sceneView: ARSCNView = ARSCNView()) -> ARPlacerViewController {
        let controller = ARPlacerViewControllerComposer.composeWith(objectPlacer: ObjectPlacerSpy(), sceneView: sceneView)
        return controller
    }
    
    private class ObjectPlacerSpy: ObjectPlacer {
        func place(in sceneView: ARSCNView, at position: CGPoint) -> Bool {
            return true
        }
    }
}
