//
//  UIStackView + Extension.swift
//  Rick&Morty_Test
//
//  Created by Valeriya Trofimova on 12.09.2023.
//

import Foundation
import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
