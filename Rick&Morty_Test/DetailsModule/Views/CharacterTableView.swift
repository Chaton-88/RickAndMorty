//
//  CharacterTableView.swift
//  Rick&Morty_Test
//
//  Created by Valeriya Trofimova on 12.09.2023.
//

import Foundation
import UIKit

enum IdDetailsTableCell: String {
    case nameCell
    case infoCell
    case originCell
    case headerCell
}

class CharacterTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        register(NameTableViewCell.self, forCellReuseIdentifier: IdDetailsTableCell.nameCell.rawValue)
        register(InfoTableViewCell.self, forCellReuseIdentifier: IdDetailsTableCell.infoCell.rawValue)
        register(OriginTableViewCell.self, forCellReuseIdentifier: IdDetailsTableCell.originCell.rawValue)
        register(CharacterTableHeaderView.self, forHeaderFooterViewReuseIdentifier: IdDetailsTableCell.headerCell.rawValue)
        
        delegate = self
        
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension CharacterTableView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height: CGFloat
        
        switch Section(section: indexPath.section) {
        case .name: height = 308
        case .info: height = 124
        case .origin: height = 106
        case .unknown: height = 0
        }
        
        return height
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: IdDetailsTableCell.headerCell.rawValue) as! CharacterTableHeaderView
        headerView.installationHeader(section: section)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return CGFloat.leastNormalMagnitude
        }
        return 37
    }
}

