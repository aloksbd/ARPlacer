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
    
    func test_displaysPlacingInformation() {
        let (view, sut) = makeSUT()
        let information = "Tap to place a random object"
        
        sut.showPlacingInformation()
        
        XCTAssertEqual(view.message, information)
    }
    
    func test_displaysErrorWhenSessionFails() {
        let (view, sut) = makeSUT()
        let error = "Some Error"
        
        sut.sessionFailed(with: error)
        
        XCTAssertEqual(view.message, error)
    }
    
    func test_displaysCannotPlaceError() {
        let (view, sut) = makeSUT()
        let error = "Cannot place object. Maybe the surface you are pointing is too far or too plain."
        
        sut.cannotPlaceObject()
        
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
        
        func displayAndHide(information: String) {
            message = information
        }
        
        func displayAndHide(error: String) {
            message = error
        }
    }

}
