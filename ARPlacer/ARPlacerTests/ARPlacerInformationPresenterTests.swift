//
//  ARPlacerInformationPresenterTests.swift
//  ARPlacerTests
//
//  Created by alok subedi on 24/11/2021.
//

import XCTest
import ARPlacer

class ARPlacerInformationPresenterTests: XCTestCase {
    
    func test_displaysInformationForScanningTheSurrounding() {
        let informationView = InformationViewSpy()
        let sut = ARPlacerInformationPresenter(informationView: informationView)
        let information = "Please move your camera slowly to scan the surrounding"
        
        sut.showScanningInformation()
        
        XCTAssertEqual(informationView.message, information)
    }
    
    //MARK: Helpers
    
    private class InformationViewSpy: InformationView {
        private(set) var message: String?
        
        func display(information: String) {
            message = information
        }
    }

}


