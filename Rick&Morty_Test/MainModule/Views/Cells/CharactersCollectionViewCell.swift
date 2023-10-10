//
//  CharactersCollectionViewCell.swift
//  Rick&Morty_Test
//
//  Created by Valeriya Trofimova on 20.08.2023.
//

import Foundation
import UIKit
import AlamofireImage

class CharactersCollectionViewCell: UICollectionViewCell {
    
    private let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let characterLabel: UILabel = {
        let label = UILabel()
        label.font = .gilroySemibold17()
        label.adjustsFontSizeToFitWidth = true
        label.sizeToFit()
        label.textAlignment = .center
        label.textColor = .basicLabelColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .collectionCellBackgroundColor
        layer.cornerRadius = 16
        
        contentView.addSubview(characterImageView)
        contentView.addSubview(characterLabel)
    }
}

//MARK: - setConstraints

extension CharactersCollectionViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            characterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            characterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -54),
        ])
        
        NSLayoutConstraint.activate([
            characterLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 16),
            characterLabel.widthAnchor.constraint(equalToConstant: 165),
            characterLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            characterLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}

//MARK: - preservationModel

extension CharactersCollectionViewCell {
    
    func preservationModel(_ model: CharacterResults?) {
        guard let imageURL = model?.imageURL else {return }
        guard let url = URL(string: imageURL) else { return }
        characterLabel.text = model?.name
        characterImageView.af.setImage(withURL: url,
                                       placeholderImage: UIImage(named: "rick&morty"),
                                       filter: nil,
                                       imageTransition: .crossDissolve(0.2))
    }
}
