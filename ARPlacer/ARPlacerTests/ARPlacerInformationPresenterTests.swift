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
        let (view, sut) = makeSUT()
        let information = "Please move your camera slowly to scan the surrounding"
        
        sut.showScanningInformation()
        
        XCTAssertEqual(view.message, information)
    }
    
    func test_displaysInformationForScanningTheSurroundingWhenTrackingIsLimited() {
        let (view, sut) = makeSUT()
        let information = "Camera Tracking is off. \nPlease move your camera slowly to scan the surrounding"
        
        sut.showLimitedTrackingInformation()
        
        XCTAssertEqual(view.message, information)
    }
    
    func test_displaysErrorWhenSessionFails() {
        let (view, sut) = makeSUT()
        let error = "Some Error"
        
        sut.sessionFailed(with: error)
        
        XCTAssertEqual(view.message, error)
    }
    
    //MARK: Helpers
    
    private func makeSUT() -> (view: InformationViewSpy, sut: ARPlacerInformationPresenter){
        let view = InformationViewSpy()
        let sut = ARPlacerInformationPresenter(informationView: view, errorView: view)
        return (view, sut)
    }
    
    private class InformationViewSpy: InformationView, ErrorView {
        private(set) var message: String?
        
        func display(information: String) {
            message = information
        }
        
        func display(error: String) {
            message = error
        }
    }

}