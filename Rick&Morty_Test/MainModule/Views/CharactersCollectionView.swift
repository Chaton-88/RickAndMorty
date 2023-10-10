//
//  CharacterCollectionView.swift
//  Rick&Morty_Test
//
//  Created by Valeriya Trofimova on 20.08.2023.
//

import Foundation
import UIKit

protocol SelectProposedCharacterProtocol: AnyObject {
    func selectProposedCharacter(indexPath: IndexPath)
}

enum IdCollectionCell: String {
    case charactersCell
}

class CharactersCollectionView: UICollectionView {
    
    weak var selactCharacter: SelectProposedCharacterProtocol?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
       
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: IdCollectionCell.charactersCell.rawValue)
        delegate = self
        
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension CharactersCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2 - 16,
               height: 202)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selactCharacter?.selectProposedCharacter(indexPath: indexPath)
    }
}
