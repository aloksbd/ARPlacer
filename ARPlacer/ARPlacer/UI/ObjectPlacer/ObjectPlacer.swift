//
//  ObjectPlacer.swift
//  ARPlacer
//
//  Created by alok subedi on 26/11/2021.
//

import CoreGraphics

public protocol ObjectPlacer {
    func place(in position: CGPoint) -> Bool
}
