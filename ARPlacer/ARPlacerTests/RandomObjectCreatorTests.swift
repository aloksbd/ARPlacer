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
        let rawValueForSphere = 1
        let node = RandomObjectCreator.create(randomNumberGenerator: { rawValueForSphere })
        XCTAssert(node.geometry is SCNSphere)
    }
    
    func test_createReturnsBoxWhenRandomNumberIsRawValueForBox() {
        let rawValueForBox = 2
        let node = RandomObjectCreator.create(randomNumberGenerator: { rawValueForBox })
        XCTAssert(node.geometry is SCNBox)
    }
    
    func test_createReturnsTorusWhenRandomNumberIsRawValueForTorus() {
        let rawValueForTorus = 3
        let node = RandomObjectCreator.create(randomNumberGenerator: { rawValueForTorus })
        XCTAssert(node.geometry is SCNTorus)
    }
}
