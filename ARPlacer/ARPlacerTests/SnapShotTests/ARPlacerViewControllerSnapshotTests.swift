//
//  ARPlacerViewControllerSnapshotTests.swift
//  ARPlacerTests
//
//  Created by alok subedi on 27/11/2021.
//

import XCTest
import ARPlacer

class FeedSnapshotTests: XCTestCase {
    func test_information() {
        let sut = makeSUT()
        
        sut.display(information: "This is a\nmultiline\ninformation.")

        assert(snapshot: sut.snapshot(for: .iPhone8(style: .light)), named: "INFORMATION_light")
        assert(snapshot: sut.snapshot(for: .iPhone8(style: .dark)), named: "INFORMATION_dark")
    }
    
    func test_error() {
        let sut = makeSUT()
        
        sut.display(error: "This is a\nmultiline\nerror.")

        assert(snapshot: sut.snapshot(for: .iPhone8(style: .light)), named: "ERROR_light")
        assert(snapshot: sut.snapshot(for: .iPhone8(style: .dark)), named: "ERROR_dark")
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
        let bundle = Bundle(for: ARPlacerViewController.self)
        let storyboard = UIStoryboard(name: "ARPlacer", bundle: bundle)
        let controller = storyboard.instantiateInitialViewController() as! ARPlacerViewController
        controller.loadViewIfNeeded()
        return controller
    }
}
