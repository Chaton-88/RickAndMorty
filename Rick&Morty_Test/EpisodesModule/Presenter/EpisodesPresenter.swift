//
//  EpisodesPresenter.swift
//  Rick&Morty_Test
//
//  Created by Valeriya Trofimova on 02.10.2023.
//

import Foundation

protocol EpisodesViewInput: AnyObject {
    func presentEpisodes(episodes: [EpisodeResults]?)
}

protocol EpisodesViewOutput: AnyObject {
    init(viewInput: EpisodesViewInput?, router: RouterProtocol?)
    var episodeResult: [EpisodeResults]? { get set }
    func setEpisodes()
}

class EpisodesPresenter: EpisodesViewOutput {
    
    weak var viewInput: EpisodesViewInput?
    var router: RouterProtocol?
    var episodeResult: [EpisodeResults]?
    private var episodesRequest: APIRequest<EpisodeResource>?
    
    required init(viewInput: EpisodesViewInput?, router: RouterProtocol?) {
        self.viewInput = viewInput
        self.router = router
    }
    
    public func setEpisodes() {
        let resourse = EpisodeResource()
        guard let url = resourse.url(path: Endpoint.episode.rawValue) else { return }
        let request = APIRequest(resourse: resourse)
        self.episodesRequest = request
        
        request.execute(url: url) { [ weak self ] episodes in
            guard let self = self else { return }
            guard let episodes = episodes else { return }
            self.episodeResult = episodes.results
            self.viewInput?.presentEpisodes(episodes: episodeResult)
        }
    }
}

