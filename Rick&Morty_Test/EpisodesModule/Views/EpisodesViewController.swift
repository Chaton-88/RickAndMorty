//
//  EpisodesViewController.swift
//  Rick&Morty_Test
//
//  Created by Valeriya Trofimova on 02.10.2023.
//

import Foundation
import UIKit

class EpisodesViewController: UIViewController {
    
    private let episodesTabliView = EpisodesTableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    var presenter: EpisodesViewOutput!
    
    private var episodes: [EpisodeResults]? {
        didSet {
            episodesTabliView.reloadData()
        }
    }
    
    private func setupNavigationBar() {
        
        let titleLabel = UILabel(text: "Episodes",
                                 font: .gilroyBold28(),
                                 textColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1))
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
    }
    
    private func setupViews() {
        view.backgroundColor =  #colorLiteral(red: 0.01568627451, green: 0.04705882353, blue: 0.1176470588, alpha: 1)
        view.addSubview(episodesTabliView)
    }
    
    private func setDelegates() {
        episodesTabliView.dataSource = self
    }
}


//MARK: - setConstaints

extension EpisodesViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            episodesTabliView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            episodesTabliView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            episodesTabliView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            episodesTabliView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: .zero)
        ])
    }
}

//MARK: - UITableViewDataSource

extension EpisodesViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        episodes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IdEpisodesTableCell.episodesCell.rawValue, for: indexPath) as? EpisodesTableViewCell else { return UITableViewCell() }
        let episode = episodes?[indexPath.row]
        cell.preservationModel(episode)
        return cell
    }
}

//MARK: - EpisodesViewInput

extension EpisodesViewController: EpisodesViewInput {
    
    func presentEpisodes(episodes: [EpisodeResults]?) {
        self.episodes = episodes
    } 
}
