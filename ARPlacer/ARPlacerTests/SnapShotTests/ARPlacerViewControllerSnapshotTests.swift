//
//  ARPlacerViewControllerSnapshotTests.swift
//  ARPlacerTests
//
//  Created by alok subedi on 27/11/2021.
//

import XCTest
import ARPlacer
import ARKit

class FeedSnapshotTests: XCTestCase {
    func test_information() {
        let sut = makeSUT()
        
        sut.display(information: "This is a\nmultiline\ninformation.")

        assert(snapshot: sut.snapshot(for: .iPhone8(style: .light)), named: "INFORMATION_light")
    }
    
    func test_error() {
        let sut = makeSUT()
        
        sut.display(error: "This is a\nmultiline\nerror.")

        assert(snapshot: sut.snapshot(for: .iPhone8(style: .light)), named: "ERROR_light")
    }
    
    func test_errorAfterInformation() {
        let sut = makeSUT()
        
        sut.display(information: "This is a\nmultiline\ninformation.")
        sut.display(error: "This is a\nmultiline\nerror.")

        assert(snapshot: sut.snapshot(for: .iPhone8(style: .light)), named: "ERROR_AFTER_INFORMATION_light")
    }
    
    func test_informationAfterError() {
        let sut = makeSUT()
        
        sut.display(error: "This is a\nmultiline\nerror.")
        sut.display(information: "This is a\nmultiline\ninformation.")

        assert(snapshot: sut.snapshot(for: .iPhone8(style: .light)), named: "INFORMATION_AFTER_ERROR_light")
    }
    
    // MARK: Helpers
    
    private func makeSUT() -> ARPlacerViewController {
        let objectPlacer = ObjectPlacerSpy()
        let controller = ARPlacerViewControllerComposer.composeWith(objectPlacer: objectPlacer)
        controller.loadViewIfNeeded()
        return controller
    }
    
    private class ObjectPlacerSpy: ObjectPlacer {
        func place(in sceneView: ARSCNView, at position: CGPoint) -> Object? {
            return nil
        }
    }
}
