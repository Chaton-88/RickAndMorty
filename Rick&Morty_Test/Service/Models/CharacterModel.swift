//
//  CharacterModel.swift
//  Rick&Morty_Test
//
//  Created by Valeriya Trofimova on 28.08.2023.
//

import Foundation
import UIKit

//MARK: - CharacterModel

struct CharacterModel: Codable {
    let info: Info
    let results: [CharacterResults]

    enum CodingKeys: String, CodingKey {
        case info
        case results
    }
}

// MARK: - Info

struct Info: Codable {
    let count, pages: Int
    let next: String
    let prev: String?
}

// MARK: - Result

struct CharacterResults: Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: Location
    let imageURL: String
    let episode: [String]
    let url: String
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name, status, species, type
        case gender
        case origin, location
        case imageURL = "image"
        case episode
        case url
        case created
    }
}

// MARK: - Location

struct Location: Codable {
    let name: String
    let url: String
}

