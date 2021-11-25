//
//  ARSCNView+TestHelpers.swift
//  ARPlacerTests
//
//  Created by alok subedi on 26/11/2021.

import ARKit

extension ARSCNView {
    static var defaultGestureRecognizers: Int {
        let newInstance = ARSCNView()
        return newInstance.gestureRecognizers?.count ?? 0
    }
    
    func simulateTap() {
        let tapGestureRecognizer = gestureRecognizers?.last as? UITapGestureRecognizer
        tapGestureRecognizer?.state = .ended
    }
}
