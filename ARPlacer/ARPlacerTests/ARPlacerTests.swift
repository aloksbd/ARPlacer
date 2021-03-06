//
//  ARPlacerTests.swift
//  ARPlacerTests
//
//  Created by alok subedi on 24/11/2021.
//

import XCTest
import ARPlacer
import ARKit

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
