//
//  AssemblyModuleBuilder.swift
//  Rick&Morty_Test
//
//  Created by Valeriya Trofimova on 30.08.2023.
//

import Foundation
import UIKit

protocol AssemblyBuilderProtocol: AnyObject {
    func makeCharactersModule(router: RouterProtocol) -> UIViewController
    func makeCharacterDetailModule(router: RouterProtocol, character: CharacterResults?, urlLocation: URL?) -> UIViewController
    func makeEpisodesModule(router: RouterProtocol) -> UIViewController
}

class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    
    func makeCharactersModule(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let presenter = CharactersPresenter(viewInput: view, router: router)
        view.presenter = presenter
        presenter.getCharacterResponse()
        return view
    }
    
    func makeCharacterDetailModule(router: RouterProtocol, character: CharacterResults?, urlLocation: URL?) -> UIViewController {
        let view = CharacterViewController()
        let presenter = CharacterDetailPresenter(viewInput: view, router: router, characterDetail: character, urlLocation: urlLocation)
        view.presenter = presenter
        return view
    }
    
    func makeEpisodesModule(router: RouterProtocol) -> UIViewController {
        let view = EpisodesViewController()
        let presenter = EpisodesPresenter(viewInput: view, router: router)
        view.presenter = presenter
        presenter.setEpisodes()
        return view
    }
}
