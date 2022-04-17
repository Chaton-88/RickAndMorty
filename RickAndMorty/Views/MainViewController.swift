//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Valeriya Trofimova on 14.04.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private let identifierCell = "idCell"
    
    private lazy var backButton: UIBarButtonItem = {
        return UIBarButtonItem(title: "Back", style:.plain, target: nil, action: nil)
    }()
    
    private lazy var barButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Update", style: .done, target: self, action: #selector(update))
        button.tintColor = .black
        return button
    }()
    
    private let networkManager = NetworkManager()
    private var characterArray = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let selectedRow: IndexPath? = tableView.indexPathForSelectedRow
        if let selectedRowNotNill = selectedRow {
            tableView.deselectRow(at: selectedRowNotNill, animated: true)
        }
    }
    
    // MARK: - Setup navigation vc
    private func setupNavigation() {
        self.navigationItem.title = "Rick&Morty"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.backBarButtonItem = backButton
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    // MARK: - Setup table view
    private func setupTableView() {
        view.addSubview(tableView)
        
        let image = UIImageView(image: UIImage(named: "rick"))
        image.contentMode = .scaleToFill
        tableView.backgroundView = image
        
        tableView.toAutoLayout()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: identifierCell)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellOne = tableView.dequeueReusableCell(withIdentifier: identifierCell, for: indexPath) as! MainTableViewCell
        
        self.networkManager.fetchСharacter { character in
            self.characterArray.append(character)
            self.characterArray[indexPath.row] = character
            cellOne.configure(character: character)
        }
        
        cellOne.backgroundColor = UIColor(white: 1, alpha: 0.6)
        return cellOne
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let characterModule = characterArray[indexPath.row]
        let vc = InfoViewController()
        vc.characterModule = characterModule
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Button action
extension MainViewController {
    
    @objc private func update() {
        self.tableView.reloadData()
    }
}

