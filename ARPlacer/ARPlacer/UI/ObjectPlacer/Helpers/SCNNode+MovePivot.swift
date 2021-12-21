//
//  SCNNode+MovePivot.swift
//  ARPlacer
//
//  Created by alok on 21/12/2021.
//

import SceneKit

extension SCNNode {
    func movePivotToBottomOfNode() {
        let halfOfHeightOfNode = boundingBox.max.y
        pivot = SCNMatrix4MakeTranslation(0, -halfOfHeightOfNode, 0)
    }
}
