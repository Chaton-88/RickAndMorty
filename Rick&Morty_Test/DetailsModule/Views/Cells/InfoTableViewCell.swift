//
//  InfoTableViewCell.swift
//  Rick&Morty_Test
//
//  Created by Valeriya Trofimova on 12.09.2023.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    private let speciesLabel = UILabel(text: "Species:",
                                       font: .gilroyMedium16(),
                                       textColor: .infoTextColor)
    
    private let typeLabel = UILabel(text: "Type:",
                                    font: .gilroyMedium16(),
                                    textColor: .infoTextColor)
    
    private let genderLabel = UILabel(text: "Gender:",
                                      font: .gilroyMedium16(),
                                      textColor: .infoTextColor)
    
    lazy var infoStackView = UIStackView(arrangedSubviews:
                                            [speciesLabel,
                                             typeLabel,
                                             genderLabel],
                                         axis: .vertical,
                                         spacing: 16)
    
    private let speciesDescriptionLabel = UILabel(font: .gilroyMedium16(),
                                                  textColor: .basicLabelColor,
                                                  textAlignment: .right)
    
    private let typeDescriptionLabel = UILabel(font: .gilroyMedium16(),
                                               textColor: .basicLabelColor,
                                               textAlignment: .right)
    
    private let genderDescriptionLabel = UILabel(font: .gilroyMedium16(),
                                                 textColor: .basicLabelColor,
                                                 textAlignment: .right)
    
    lazy var infoDescriptionStackView = UIStackView(arrangedSubviews:
                                                        [speciesDescriptionLabel,
                                                         typeDescriptionLabel,
                                                         genderDescriptionLabel],
                                                     axis: .vertical,
                                                     spacing: 16)
    
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
        
        contentView.addSubview(infoStackView)
        contentView.addSubview(infoDescriptionStackView)
    }
}

//MARK: - setConstraints

extension InfoTableViewCell {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            speciesLabel.heightAnchor.constraint(equalToConstant: 20),
            typeLabel.heightAnchor.constraint(equalToConstant: 20),
            genderLabel.heightAnchor.constraint(equalToConstant: 20),
            
            infoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            infoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            infoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            speciesDescriptionLabel.heightAnchor.constraint(equalToConstant: 20),
            typeDescriptionLabel.heightAnchor.constraint(equalToConstant: 20),
            genderDescriptionLabel.heightAnchor.constraint(equalToConstant: 20),
            
            infoDescriptionStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            infoDescriptionStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            infoDescriptionStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}

// MARK: - preservationModel

extension InfoTableViewCell {
    
    func preservationModel(_ model: CharacterResults?) {
        guard let model = model else { return }
        speciesDescriptionLabel.text = model.species
        genderDescriptionLabel.text = model.gender
        
        let type = model.type != "" ? model.type : "None"
        typeDescriptionLabel.text = type
    }
}

