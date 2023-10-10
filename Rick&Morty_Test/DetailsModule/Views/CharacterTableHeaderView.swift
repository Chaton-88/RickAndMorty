//
//  CharacterTableHeaderView.swift
//  Rick&Morty_Test
//
//  Created by Valeriya Trofimova on 14.09.2023.
//

import UIKit

class CharacterTableHeaderView: UITableViewHeaderFooterView {

    private let titleLabel = UILabel(text: "",
                                     font: .gilroySemibold17(),
                                     textColor: .basicLabelColor)
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(titleLabel)
    }
}

extension CharacterTableHeaderView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .zero),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}

extension CharacterTableHeaderView {
    
    func installationHeader(section: Int) {
        
        switch Section(section: section) {
        case.name: break
        case .info: titleLabel.text = "Info"
        case .origin: titleLabel.text = "Origin"
        case .unknown: break
        }
    }
}
