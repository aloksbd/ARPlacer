//
//  ARRaycastResult+Position.swift
//  ARPlacer
//
//  Created by alok on 21/12/2021.
//

import ARKit

extension ARRaycastResult {
    var position: SCNVector3 {
        get {
            let raycastPosition = worldTransform.columns.3
            return SCNVector3(raycastPosition.x, raycastPosition.y, raycastPosition.z)
        }
    }
}
