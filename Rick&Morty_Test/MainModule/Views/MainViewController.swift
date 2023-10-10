//
//  ViewController.swift
//  Rick&Morty_Test
//
//  Created by Valeriya Trofimova on 20.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private let collectionView = CharactersCollectionView(frame: .zero,
                                                          collectionViewLayout: UICollectionViewFlowLayout())
    let searchController = UISearchController(searchResultsController: nil)
    var isSearching = false
    var presenter: ChatactersViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupNavigationBar()
        setupSearchBar()
        setConstaints()
        setDelegates()
    }
    
    private func setupViews() {
        view.backgroundColor =  #colorLiteral(red: 0.01568627451, green: 0.04705882353, blue: 0.1176470588, alpha: 1)
        view.addSubview(collectionView)
    }
    
    private func setupNavigationBar() {
        
        let titleLabel = UILabel(text: "Characters",
                                 font: .gilroyBold28(),
                                 textColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1))
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
    }
    
    //MARK: - setupSearchBar
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search for the character"
        guard let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField else { return }
        textfield.textColor = UIColor.basicLabelColor
    }
    
    private func setDelegates() {
        collectionView.dataSource = self
        collectionView.selactCharacter = self
        searchController.searchBar.delegate = self
    }
}

//MARK: - setConstaints

extension MainViewController {
    
    private func setConstaints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .zero),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .zero),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: .zero),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: .zero)
        ])
    }
}

//MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearching  {
            return presenter.filteredCharacters?.count ?? 0
        } else {
            return presenter.characters?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IdCollectionCell.charactersCell.rawValue,
                                                            for: indexPath) as? CharactersCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        let characters = presenter.characters
        let filteredCharacters = presenter.filteredCharacters
        
        if isSearching {
            cell.preservationModel(filteredCharacters?[indexPath.item])
        } else {
            cell.preservationModel(characters?[indexPath.item])
        }
        return cell
    }
}

//MARK: - SelectProposedCharacterProtocol

extension MainViewController: SelectProposedCharacterProtocol {
    
    func selectProposedCharacter(indexPath: IndexPath) {
        guard let character = presenter.characters?[indexPath.row] else { return }
        presenter.tapOnTheCharacter(character: character)
    }
}

//MARK: - CharactersViewInput

extension MainViewController: CharactersViewInput {
    
    func success() {
        collectionView.reloadData()
    }
    
    func showFilteredChatacters() {
        collectionView.reloadData()
    }
}

//MARK: - UISearchBarDelegate

extension MainViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == "" {
            isSearching = false
            collectionView.reloadData()
        } else {
            isSearching = true
            presenter.startSearchChatacter(text: searchText)
        }
    }
}
