//
//  CharacterDetailPresenter.swift
//  Rick&Morty_Test
//
//  Created by Valeriya Trofimova on 20.09.2023.
//

import Foundation
import UIKit

protocol CharacterDetailViewInput: AnyObject {
    func setDetail(character: CharacterResults?, location: LocationResults?)
}

protocol ChatacterDetailViewOutput: AnyObject {
    init(viewInput: CharacterDetailViewInput, router: RouterProtocol, characterDetail: CharacterResults?, urlLocation: URL?)
    func setCharacter()
    func tap()
}

class CharacterDetailPresenter: ChatacterDetailViewOutput {
    
    weak var viewInput: CharacterDetailViewInput?
    var router: RouterProtocol?
    var characterDetail: CharacterResults?
    var urlLocation: URL?
    private var locationRequest: APIRequest<LocationResource>?
  
    
    required init(viewInput: CharacterDetailViewInput, router: RouterProtocol, characterDetail: CharacterResults?, urlLocation: URL?) {
        self.viewInput = viewInput
        self.router = router
        self.characterDetail = characterDetail
        self.urlLocation = urlLocation
    }
    
    public func setCharacter() {
        let resourse = LocationResource()
        let request = APIRequest(resourse: resourse)
        self.locationRequest = request
        
        guard let url = urlLocation else { return }
        request.execute(url: url) { [ weak self ] location in
            guard let self = self else { return }
            self.viewInput?.setDetail(character: characterDetail, location: location)
        }
    }
    
    func tap() {
        router?.popToRoot()
    }
}
