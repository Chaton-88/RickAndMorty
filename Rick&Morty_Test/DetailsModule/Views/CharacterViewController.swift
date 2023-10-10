//
//  CharacterViewController.swift
//  Rick&Morty_Test
//
//  Created by Valeriya Trofimova on 12.09.2023.
//

import UIKit

enum Section: CaseIterable {
    case name, info, origin, unknown
    
    init(section: Int) {
        switch section {
        case 0: self = .name
        case 1: self = .info
        case 2: self = .origin
        default: self = .unknown
        }
    }
}

class CharacterViewController: UIViewController {
    
    private let tableView = CharacterTableView(frame: .zero, style: .plain)
    
    private let titleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = .basicLabelColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var presenter: ChatacterDetailViewOutput!
    
    private var characterDetail: CharacterResults? {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var locationDetail: LocationResults? {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setCharacter()
        
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    private func setupViews() {
        view.backgroundColor =  #colorLiteral(red: 0.01568627451, green: 0.04705882353, blue: 0.1176470588, alpha: 1)
        view.addSubview(tableView)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleButton)
        titleButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private func setDelegates() {
        tableView.dataSource = self
    }
    
    @objc private func buttonTapped() {
        presenter.tap()
    }
}

//MARK: - setConstaints

extension CharacterViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: .zero)
        ])
    }
}

//MARK: - UITableViewDataSource

extension CharacterViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count - 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch Section(section: indexPath.section) {
        case .name:
            let cell = tableView.dequeueReusableCell(withIdentifier: IdDetailsTableCell.nameCell.rawValue, for: indexPath) as! NameTableViewCell
            cell.preservationModel(characterDetail)
            return cell
        case .info:
            let cell = tableView.dequeueReusableCell(withIdentifier: IdDetailsTableCell.infoCell.rawValue, for: indexPath) as! InfoTableViewCell
            cell.preservationModel(characterDetail)
            return cell
        case .origin:
            let cell = tableView.dequeueReusableCell(withIdentifier: IdDetailsTableCell.originCell.rawValue, for: indexPath) as! OriginTableViewCell
            cell.preservationModel(locationDetail)
            return cell
        case .unknown:
            let cell = UITableViewCell()
            return cell
        }
    }
}

//MARK: - CharacterDetailViewInput

extension CharacterViewController: CharacterDetailViewInput {
    
    func setDetail(character: CharacterResults?, location: LocationResults?) {
        characterDetail = character
        locationDetail = location
    }
}

