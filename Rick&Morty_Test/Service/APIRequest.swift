//
//  APIRequest.swift
//  Rick&Morty_Test
//
//  Created by Valeriya Trofimova on 05.09.2023.
//

import Foundation

enum Endpoint: String {
    case character
    case episode 
}

// MARK: - APIResourseProtocol

protocol APIResourseProtocol {
    associatedtype ModelType: Codable
}

extension APIResourseProtocol {
    func url(path: String) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "rickandmortyapi.com"
        components.path = "/api/\(path)"
        let url = components.url
        return url
    }
}

// MARK: - NetworkRequestProtocol

protocol NetworkRequestProtocol: AnyObject {
    associatedtype ModelType
    func decode(_ data: Data) -> ModelType?
    func execute(url: URL, withCompletion completion: @escaping (ModelType?) -> Void)
}

extension NetworkRequestProtocol {
    func load(_ url: URL, withCompletion completion: @escaping (ModelType?) -> Void) {
        URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
            DispatchQueue.main.async {
                guard let data = data, let value = self?.decode(data) else {
                    completion(nil)
                    return
                }
                completion(value)
            }
        }.resume()
    }
}

//MARK: - APIRequest

class APIRequest<Resourse: APIResourseProtocol> {
    
    let resourse: Resourse
    
    init(resourse: Resourse) {
        self.resourse = resourse
    }
}

extension APIRequest: NetworkRequestProtocol {
    
    func decode(_ data: Data) -> Resourse.ModelType? {
        let decoder = JSONDecoder()
        let wrapper = try? decoder.decode(Resourse.ModelType.self, from: data)
        return wrapper
    }
    
    func execute(url: URL, withCompletion completion: @escaping (Resourse.ModelType?) -> Void) {
        load(url, withCompletion: completion)
    }
}
