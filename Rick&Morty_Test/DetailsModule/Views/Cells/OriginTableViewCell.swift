//
//  OriginTableViewCell.swift
//  Rick&Morty_Test
//
//  Created by Valeriya Trofimova on 13.09.2023.
//

import Foundation
import UIKit

class OriginTableViewCell: UITableViewCell {
    
    private let locationView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .locationViewBackgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Planet")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .locationViewBackgroundColor
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLocationLabel = UILabel(font: .gilroySemibold17(),
                                            textColor: .basicLabelColor)
    
    private let typeLocationLabel = UILabel(font: .gilroyMedium13(),
                                            textColor: .greenLabelColor)
    
    private let dimensionLocationLabel = UILabel(font: .gilroyMedium13(),
                                                 textColor: .greenLabelColor)
    
    lazy var locationStackView = UIStackView(arrangedSubviews:
                                                [nameLocationLabel,
                                                 typeLocationLabel,
                                                 dimensionLocationLabel],
                                             axis: .vertical,
                                             spacing: 8)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
      
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .tableCellBackgroundColor
        layer.cornerRadius = 16
        selectionStyle = .none
        
        contentView.addSubview(locationView)
        locationView.addSubview(locationImageView)
        contentView.addSubview(locationStackView)
    }
}

//MARK: - setConstraints

extension OriginTableViewCell {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            locationView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            locationView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            locationView.widthAnchor.constraint(equalToConstant: 64),
            locationView.heightAnchor.constraint(equalTo: locationView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            locationImageView.centerYAnchor.constraint(equalTo: locationView.centerYAnchor),
            locationImageView.centerXAnchor.constraint(equalTo: locationView.centerXAnchor),
            locationImageView.widthAnchor.constraint(equalToConstant: 24),
            locationImageView.heightAnchor.constraint(equalTo: locationImageView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameLocationLabel.heightAnchor.constraint(equalToConstant: 22),
            typeLocationLabel.heightAnchor.constraint(equalToConstant: 18),
            dimensionLocationLabel.heightAnchor.constraint(equalToConstant: 18),
           
            locationStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            locationStackView.leadingAnchor.constraint(equalTo: locationView.trailingAnchor, constant: 16),
            locationStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}

// MARK: - preservationModel

extension OriginTableViewCell {
    
    func preservationModel(_ model: LocationResults?) {
        guard let model = model else { return }
        nameLocationLabel.text = model.name
        typeLocationLabel.text = model.type
        dimensionLocationLabel.text = model.dimension
    }
}

