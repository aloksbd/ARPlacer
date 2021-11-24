//
//  ARPlacerTests.swift
//  ARPlacerTests
//
//  Created by alok subedi on 24/11/2021.
//

import XCTest
import ARKit

class ARPlacerSessionDelegate: NSObject, ARSessionDelegate {
    var sessionFailedWithError: ((String) -> Void)?
    var onLimited: (() -> Void)?
    var onNotAvailable: (() -> Void)?
    var onNormal: (() -> Void)?
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        sessionFailedWithError?(error.localizedDescription)
    }
    
    func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
        
        func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
            switch camera.trackingState {
            case .limited :
                onLimited?()
            case .notAvailable:
                onNotAvailable?()
            case .normal:
                onNormal?()
            }
        }
    }
}

class ARPlacerTests: XCTestCase {
    
    func test_notifyFailedOnARSessionFailed() {
        let someError = NSError(domain: "Some Error", code: 0, userInfo: nil)
        let sut = ARPlacerSessionDelegate()
        let exp = expectation(description: "Wait for callback")
        sut.sessionFailedWithError = { error in
            XCTAssertEqual(error, someError.localizedDescription)
            exp.fulfill()
        }
        sut.session(ARSession(), didFailWithError: someError)
        wait(for: [exp], timeout: 0.1)
    }

}
