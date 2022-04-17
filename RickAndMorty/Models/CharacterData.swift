//
//  CharacterData.swift
//  RickAndMorty
//
//  Created by Valeriya Trofimova on 16.04.2022.
//

import Foundation

struct CharacterData: Decodable {
    
    let results: [Result]
}

struct Result: Decodable {
    let name: String
    let status: String
    let species: String
    let gender: String
    let location: Location
    let image: String
    let episode: [String]
}

struct Location: Decodable {
    let name: String
}


