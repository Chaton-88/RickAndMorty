//
//  CharactersPresenter.swift
//  Rick&Morty_Test
//
//  Created by Valeriya Trofimova on 30.08.2023.
//

import Foundation

protocol CharactersViewInput: AnyObject {
    func success()
    func showFilteredChatacters()
}

protocol ChatactersViewOutput: AnyObject {
    init(viewInput: CharactersViewInput, router: RouterProtocol)
    var characters: [CharacterResults]? { get set }
    func getCharacterResponse()
    func tapOnTheCharacter(character: CharacterResults?)
    func startSearchChatacter(text: String)
    var filteredCharacters: [CharacterResults]? { get set }
}

class CharactersPresenter: ChatactersViewOutput {
    
    weak var viewInput: CharactersViewInput?
    var router: RouterProtocol?
    var characters: [CharacterResults]?
    var filteredCharacters: [CharacterResults]?
    private var request: APIRequest<CharacterResource>?
    
    required init(viewInput: CharactersViewInput, router: RouterProtocol) {
        self.viewInput = viewInput
        self.router = router
    }
    
    func getCharacterResponse() {
        let resourse = CharacterResource()
        guard let url = resourse.url(path: Endpoint.character.rawValue) else { return }
        let request = APIRequest(resourse: resourse)
        self.request = request
        
        request.execute(url: url) { [ weak self ] characters in
            guard let self = self else { return }
            guard let characters = characters else { return }
            self.characters = characters.results
            self.viewInput?.success()
        }
    }
    
    func tapOnTheCharacter(character: CharacterResults?) {
        showLocation(forCharacter: character)
    }
    
    func startSearchChatacter(text: String) {
        let text = text.lowercased()
        filteredCharacters = characters?.filter({$0.name.lowercased().contains(text)})
        viewInput?.showFilteredChatacters()
    }
}

extension CharactersPresenter {
    
    private func showLocation(forCharacter: CharacterResults?) {
        guard let url = forCharacter?.location.url else { return }
        guard let stringURL = URL(string: url) else { return }
        router?.showDetail(character: forCharacter, urlLocation: stringURL)
    }
}



