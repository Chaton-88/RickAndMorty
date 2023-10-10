//
//  Router.swift
//  Rick&Morty_Test
//
//  Created by Valeriya Trofimova on 21.09.2023.
//

import Foundation
import UIKit

protocol RouterMain: AnyObject {
    var firstNavigationController: UINavigationController? { get set }
    var secondNavigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialCharacterVC(title: String, image: UIImage?) -> UINavigationController
    func initialEpisodeVC(title: String, image: UIImage?) -> UINavigationController
    func showDetail(character: CharacterResults?, urlLocation: URL?)
    func popToRoot()
}

class Router: RouterProtocol {

    var firstNavigationController: UINavigationController?
    var secondNavigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(firstNavigationController: UINavigationController?, secondNavigationController: UINavigationController?, assemblyBuilder: AssemblyBuilderProtocol?) {
        self.firstNavigationController = firstNavigationController
        self.secondNavigationController = secondNavigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialCharacterVC(title: String, image: UIImage?) -> UINavigationController {
        guard let navigationController = firstNavigationController else { return UINavigationController() }
        let mailViewControler = assemblyBuilder?.makeCharactersModule(router: self) ?? UIViewController()
        navigationController.viewControllers = [mailViewControler]
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        return navigationController
    }
    
    func initialEpisodeVC(title: String, image: UIImage?) -> UINavigationController {
        guard let navigationController = secondNavigationController else { return UINavigationController() }
        let episodesViewController = assemblyBuilder?.makeEpisodesModule(router: self) ?? UIViewController()
        navigationController.viewControllers = [episodesViewController]
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        return navigationController
    }
    
    func showDetail(character: CharacterResults?, urlLocation: URL?) {
        guard let navigationController = firstNavigationController else { return }
        guard let detailViewControler = assemblyBuilder?.makeCharacterDetailModule(router: self, character: character, urlLocation: urlLocation) else { return }
        navigationController.pushViewController(detailViewControler, animated: true)
    }
    
    func popToRoot() {
        guard let navigationController = firstNavigationController else { return }
        navigationController.popToRootViewController(animated: true)
    }
}
