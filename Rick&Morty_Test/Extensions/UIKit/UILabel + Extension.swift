//
//  UILabel + Extension.swift
//  Rick&Morty_Test
//
//  Created by Valeriya Trofimova on 20.08.2023.
//

import Foundation
import UIKit

extension UILabel {
    
    convenience init(text: String = "",
                     font: UIFont?,
                     textColor: UIColor,
                     textAlignment: NSTextAlignment = .left) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        translatesAutoresizingMaskIntoConstraints = false
    }
}

