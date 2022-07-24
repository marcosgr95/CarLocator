//
//  Fonts.swift
//  CarLocator
//
//  Created by Marcos García Rouco on 23/7/22.
//

import Foundation
import UIKit

extension UIFont {

    class func muktaMedium() -> UIFont {
        guard
            let redressedRegularFont = UIFont(name: "Mukta-Medium", size: UIFont.labelFontSize)
        else {
            return UIFont.systemFont(ofSize: UIFont.labelFontSize)
        }
        return UIFontMetrics.default.scaledFont(for: redressedRegularFont)
    }
}
