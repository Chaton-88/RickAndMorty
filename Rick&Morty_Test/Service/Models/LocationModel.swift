//
//  LocationModel.swift
//  Rick&Morty_Test
//
//  Created by Valeriya Trofimova on 23.09.2023.
//

import Foundation

//MARK: - CharacterModel

struct LocationModel: Codable {
    let results: [LocationResults]
}

struct LocationResults: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}

