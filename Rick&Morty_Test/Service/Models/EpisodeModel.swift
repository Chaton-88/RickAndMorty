//
//  EpisodeModel.swift
//  Rick&Morty_Test
//
//  Created by Valeriya Trofimova on 28.08.2023.
//

import Foundation

// MARK: - EpisodeModel

struct EpisodeModel: Codable {
    let info: InfoEpisode
    let results: [EpisodeResults]
}

// MARK: - InfoEpisode

struct InfoEpisode: Codable {
    let count, pages: Int
    let next: String
    let prev: String?
}

// MARK: - EpisodeResults

struct EpisodeResults: Codable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
