//
//  extensionView.swift
//  RickAndMorty
//
//  Created by Valeriya Trofimova on 15.04.2022.
//

import UIKit

extension UIView {
    
    func toAutoLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}
