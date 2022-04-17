//
//  Character.swift
//  RickAndMorty
//
//  Created by Valeriya Trofimova on 16.04.2022.
//

import Foundation

struct Character {
    
    var name: String = ""
    var status: String = ""
    var species: String = ""
    var gender: String = ""
    var location: String = ""
    var image: String = ""
    var episode: [String] = []
    
    init?(characterData: CharacterData) {
        name = characterData.results.first!.name
        status = characterData.results.first!.status
        species = characterData.results.first!.species
        gender = characterData.results.first!.gender
        location = characterData.results.first!.location.name
        image = characterData.results.first!.image
        episode = characterData.results.first!.episode
    }
    
    init() {}
}
