//
//  EpisodesTableView.swift
//  Rick&Morty_Test
//
//  Created by Valeriya Trofimova on 29.09.2023.
//

import Foundation
import UIKit

enum IdEpisodesTableCell: String {
    case episodesCell
}

class EpisodesTableView: UITableView {
    
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        register(EpisodesTableViewCell.self, forCellReuseIdentifier: IdEpisodesTableCell.episodesCell.rawValue)
        
        delegate = self
        
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
        showsVerticalScrollIndicator = false
    }
}

//MARK: - UITableViewDelegate

extension EpisodesTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 122
    }
}
