//
//  RandomObject.swift
//  ARPlacer
//
//  Created by alok subedi on 25/11/2021.
//

public enum RandomObject: Int {
    case sphere, torus, box
    
    // make sure box is last rawValue, or change the box below to the last case
    public static var count: Int { RandomObject.box.rawValue }
}
