//
//  UIColor+RandomColor.swift
//  ARPlacer
//
//  Created by alok on 21/12/2021.
//

import UIKit

extension UIColor {
    private static func randomColorRatio() -> CGFloat {
        return CGFloat(Int.random(in: 0...10))/10
    }
    
    static func randomColor() -> UIColor {
        let red = randomColorRatio()
        let green = randomColorRatio()
        let blue = randomColorRatio()
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}
