//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Valeriya Trofimova on 16.04.2022.
//

import Foundation

struct NetworkManager {
    
    func fetchСharacter(completionHandler: @escaping (Character) -> Void) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "rickandmortyapi.com"
        urlComponents.path = "/api/character/"
        urlComponents.query = "page=\(Int.random(in: 0..<43))"
      
        if let url = urlComponents.url {
            
            var request = URLRequest(url: url, timeoutInterval: Double.infinity)
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    fatalError("some error\(String(describing: error))")
                }
                if let character = self.parseJSON(withData: data) {
                    completionHandler(character)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(withData data: Data) -> Character? {
        let decoder = JSONDecoder()
        do {
            let characterData = try decoder.decode(CharacterData.self, from: data)
            guard let chatacter = Character(characterData: characterData) else { return nil }
            
            return chatacter
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
