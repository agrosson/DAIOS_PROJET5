//
//  Engine.swift
//  DAIOS_PROJET5
//
//  Created by ALEXANDRE GROSSON on 02/12/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import Foundation
import UIKit

/**
 Extension on UIView to transform a UIView into an Image
 */

extension UIView {
    var renderedImage: UIImage? {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in layer.render(in: rendererContext.cgContext) }
    }
}
