//
//  RandomObjectCreatorTests.swift
//  ARPlacerTests
//
//  Created by alok subedi on 25/11/2021.
//

import XCTest
import ARPlacer
import SceneKit

class RandomObjectCreatorTests: XCTestCase {
    
    func test_createReturnsSphereWhenRandomNumberIsRawValueForSphere() {
        let rawValueForSphere = RandomObject.sphere.rawValue
        let node = RandomObjectCreator.create(randomNumberGenerator: { rawValueForSphere })
        XCTAssert(node.geometry is SCNSphere)
    }
}
