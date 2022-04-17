//
//  MainTableViewCell.swift
//  RickAndMorty
//
//  Created by Valeriya Trofimova on 15.04.2022.
//

import UIKit

final class MainTableViewCell: UITableViewCell {
    
    private var pictureView: UIImageView = {
        let pictureView = UIImageView()
        pictureView.toAutoLayout()
        pictureView.layer.cornerRadius = 40
        pictureView.contentMode = .scaleAspectFit
        pictureView.clipsToBounds = true
        return pictureView
    }()
    
    private var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        nameLabel.textColor = .black
        nameLabel.numberOfLines = 0
        nameLabel.toAutoLayout()
        return nameLabel
    }()
    
    private var infoLabel: UILabel = {
        let infoLabel = UILabel()
        infoLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        infoLabel.textColor = .black
        infoLabel.toAutoLayout()
        return infoLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup views
    private func setupViews() {
        
        contentView.addSubviews(pictureView, nameLabel, infoLabel)
       
        NSLayoutConstraint.activate([
            pictureView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            pictureView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            pictureView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            pictureView.widthAnchor.constraint(equalToConstant: 80),
            pictureView.heightAnchor.constraint(equalTo: pictureView.widthAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: pictureView.trailingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: pictureView.topAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            infoLabel.leadingAnchor.constraint(equalTo: pictureView.trailingAnchor, constant: 10),
            infoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            infoLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
        ])
    }
}

// MARK: - Configure character
extension MainTableViewCell {
    
    func configure(character: Character) {
        
        DispatchQueue.main.async { [weak self] in
            self?.pictureView.downloaded(from: character.image)
            self?.nameLabel.text = character.name
            self?.infoLabel.text = "\(character.species), \(character.gender)"
        }
    }
}



