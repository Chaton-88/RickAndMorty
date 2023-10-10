//
//  EpisodesTableViewCell.swift
//  Rick&Morty_Test
//
//  Created by Valeriya Trofimova on 14.09.2023.
//

import Foundation
import UIKit

class EpisodesTableViewCell: UITableViewCell {
    
    private let backgroundEpisodeView: UIView = {
        let view = UIView()
        view.backgroundColor = .tableCellBackgroundColor
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let episodeLabel = UILabel(font: .gilroySemibold17(),
                                       textColor: .basicLabelColor)
    
    private let nameLabel = UILabel(font: .gilroyMedium13(),
                                    textColor: .greenLabelColor)
    
    private let airDateLabel = UILabel(font: .gilroyMedium12(),
                                       textColor: .airDateLabelColor)
    
    lazy var episodeStackView = UIStackView(arrangedSubviews:
                                                [episodeLabel,
                                                nameLabel,
                                                airDateLabel],
                                            axis: .vertical,
                                            spacing: 10)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = #colorLiteral(red: 0.01568627451, green: 0.04705882353, blue: 0.1176470588, alpha: 1)
        selectionStyle = .none
        
        contentView.addSubview(backgroundEpisodeView)
        backgroundEpisodeView.addSubview(episodeStackView)
    }
}

//MARK: - setConstraints

extension EpisodesTableViewCell {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundEpisodeView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .zero),
            backgroundEpisodeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .zero),
            backgroundEpisodeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: .zero),
            backgroundEpisodeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14)
        ])
        
        NSLayoutConstraint.activate([
            episodeLabel.heightAnchor.constraint(equalToConstant: 22),
            nameLabel.heightAnchor.constraint(equalToConstant: 18),
            airDateLabel.heightAnchor.constraint(equalToConstant: 16),

            episodeStackView.topAnchor.constraint(equalTo: backgroundEpisodeView.topAnchor, constant: 16),
            episodeStackView.leadingAnchor.constraint(equalTo: backgroundEpisodeView.leadingAnchor, constant: 15.25),
            episodeStackView.bottomAnchor.constraint(equalTo: backgroundEpisodeView.bottomAnchor, constant: -16)
        ])
    }
}

//MARK: - preservationModel

extension EpisodesTableViewCell {
    
    func preservationModel(_ model: EpisodeResults?) {
        guard let model = model else { return }
       
        let episode = model.episode
        let intArray = episode.components(separatedBy: CharacterSet.decimalDigits.inverted).compactMap(Int.init)
        let text = "Episod: \(intArray[0]), Season: \(intArray[1])"
        episodeLabel.text = text
        
        nameLabel.text = model.name
        airDateLabel.text = "Aired on \(model.airDate)"
    }
}

