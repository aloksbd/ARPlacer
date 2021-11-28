//
//  ARPlacerViewControllerIntegrationTest.swift
//  ARPlacerTests
//
//  Created by alok subedi on 28/11/2021.
//

import XCTest
import ARPlacer
import ARKit

class ARPlacerViewControllerIntegrationTest: XCTestCase {
    func test_textLabelIsHiddenOnViewDidLoad() {
        let sut = makeSUT()
        
        sut.loadViewIfNeeded()
        
        XCTAssertTrue(sut.textLabel.isHidden)
    }
    
    // MARK: Helpers
    
    private func makeSUT() -> ARPlacerViewController {
        let bundle = Bundle(for: ARPlacerViewController.self)
        let storyboard = UIStoryboard(name: "ARPlacer", bundle: bundle)
        let controller = storyboard.instantiateInitialViewController() as! ARPlacerViewController
        return controller
    }
}
