//
//  NameTableViewCell.swift
//  Rick&Morty_Test
//
//  Created by Valeriya Trofimova on 15.09.2023.
//

import UIKit

class NameTableViewCell: UITableViewCell {
    
    private let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel = UILabel(font: .gilroyBold22(),
                                    textColor: .basicLabelColor)
    
    private let statusLabel = UILabel(font: .gilroyMedium16(),
                                      textColor: .greenLabelColor)
    
    private let statusView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setNeedsUpdateConfiguration() {
        statusView.layer.cornerRadius = statusView.frame.size.width / 2
    }
    
    private func setupViews() {
        backgroundColor =  #colorLiteral(red: 0.01568627451, green: 0.04705882353, blue: 0.1176470588, alpha: 1)
        selectionStyle = .none
        
        contentView.addSubview(characterImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(statusView)
    }
}

//MARK: - setConstraints

extension NameTableViewCell {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            characterImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            characterImageView.heightAnchor.constraint(equalToConstant: 200),
            characterImageView.widthAnchor.constraint(equalTo: characterImageView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 24),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            statusLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            statusView.centerYAnchor.constraint(equalTo: statusLabel.centerYAnchor),
            statusView.trailingAnchor.constraint(equalTo: statusLabel.leadingAnchor, constant: -5),
            statusView.heightAnchor.constraint(equalToConstant: 10),
            statusView.widthAnchor.constraint(equalTo: statusView.heightAnchor)
        ])
    }
}

//MARK: - preservationModel

extension NameTableViewCell {
    
    func preservationModel(_ model: CharacterResults?) {
        guard let model = model else { return }
        let imageURL = model.imageURL 
        guard let url = URL(string: imageURL) else { return }
        nameLabel.text = model.name
        statusLabel.text = model.status
        installColor(status: model.status)
        
        characterImageView.af.setImage(withURL: url,
                                       placeholderImage: UIImage(named: "rick&morty"),
                                       filter: nil,
                                       imageTransition: .crossDissolve(0.2))
    }
    
    func installColor(status: String) {
        switch status {
        case "Dead": statusView.backgroundColor = .red
        case "Alive": statusView.backgroundColor = .green
        default: statusView.backgroundColor = .gray
        }
    }
}
