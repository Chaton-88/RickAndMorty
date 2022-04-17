//
//  InfoViewController.swift
//  RickAndMorty
//
//  Created by Valeriya Trofimova on 15.04.2022.
//

import UIKit

final class InfoViewController: UIViewController {
    
    var characterModule = Character()
    
    private let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.toAutoLayout()
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return titleLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.toAutoLayout()
        descriptionLabel.textColor = .black
        return descriptionLabel
    }()
    
    private let statusView: UIView = {
        let statusView = UIView()
        statusView.toAutoLayout()
        statusView.layer.cornerRadius = 5
        statusView.clipsToBounds = true
        return statusView
    }()
    
    private let statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.toAutoLayout()
        statusLabel.textColor = .black
        return statusLabel
    }()
    
    private let locationConst: UILabel = {
        let locationConst = UILabel()
        locationConst.text = "Last known location:"
        locationConst.toAutoLayout()
        locationConst.textColor = .gray
        return locationConst
    }()
    
    private let location: UILabel = {
        let location = UILabel()
        location.toAutoLayout()
        location.textColor = .black
        return location
    }()
    
    private let episodesConst: UILabel = {
        let episodesConst = UILabel()
        episodesConst.text = "Number of episodes:"
        episodesConst.toAutoLayout()
        episodesConst.textColor = .gray
        return episodesConst
    }()
    
    private let episodes: UILabel = {
        let episodes = UILabel()
        episodes.toAutoLayout()
        episodes.textColor = .black
        return episodes
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        retreshViews()
    }
}

// MARK: - Setup views
extension InfoViewController {
    
    private func setupViews(){
        view.backgroundColor = .darkGray
        
        view.addSubviews(characterImageView,
                         titleLabel,
                         descriptionLabel,
                         statusLabel,
                         locationConst,
                         location,
                         episodesConst,
                         episodes,
                         statusView)
        
        NSLayoutConstraint.activate([
            
            characterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            characterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            characterImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            characterImageView.heightAnchor.constraint(equalTo: characterImageView.widthAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: characterImageView.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 24),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: characterImageView.leadingAnchor),
            
            statusView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            statusView.leadingAnchor.constraint(equalTo: characterImageView.leadingAnchor),
            statusView.widthAnchor.constraint(equalToConstant: 10),
            statusView.heightAnchor.constraint(equalTo: statusView.widthAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            statusLabel.leadingAnchor.constraint(equalTo: statusView.trailingAnchor,constant: 8),
            
            locationConst.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 18),
            locationConst.leadingAnchor.constraint(equalTo: characterImageView.leadingAnchor),
            
            location.topAnchor.constraint(equalTo: locationConst.bottomAnchor, constant: 5),
            location.leadingAnchor.constraint(equalTo: characterImageView.leadingAnchor),
            
            episodesConst.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 18),
            episodesConst.leadingAnchor.constraint(equalTo: characterImageView.leadingAnchor),
            
            episodes.leadingAnchor.constraint(equalTo: episodesConst.trailingAnchor, constant: 8),
            episodes.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 18)
        ])
    }
}

extension InfoViewController {
    
    private func retreshViews() {
        
        characterImageView.downloaded(from: characterModule.image)
        titleLabel.text = characterModule.name
        descriptionLabel.text = "\(String(describing: characterModule.species)), \(String(describing: characterModule.gender))"
        statusLabel.text = characterModule.status
        location.text = characterModule.location
        episodes.text = String(describing: characterModule.episode.count)
        
        switch characterModule.status {
        case "Dead":
            statusView.backgroundColor = .red
        case "Alive":
            statusView.backgroundColor = .green
        default:
            statusView.backgroundColor = .yellow
        }
    }
}

