//
//  MainTabBarController.swift
//  Rick&Morty_Test
//
//  Created by Valeriya Trofimova on 27.09.2023.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    lazy var characterImage = UIImage(systemName: "person.3.sequence")
    lazy var eposodeImage = UIImage(systemName: "display")
    let firstNavController = UINavigationController()
    let secondNavController = UINavigationController()
    let assemblyBuilder = AssemblyModuleBuilder()
    
    lazy var mainRouter = Router(firstNavigationController: firstNavController,
                                 secondNavigationController: secondNavController,
                                 assemblyBuilder: assemblyBuilder)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateVC()
        generateTabBar()
    }
}

extension MainTabBarController {
    
    func generateVC() {
        let characterVC = mainRouter.initialCharacterVC(title: "Characters", image: characterImage)
        let episodeVC = mainRouter.initialEpisodeVC(title: "Episodes", image: eposodeImage)
        viewControllers = [characterVC, episodeVC]
    }
    
    private func generateTabBar() {
        tabBar.barTintColor = #colorLiteral(red: 0.2249567393, green: 0.2525112607, blue: 0.2809208465, alpha: 0.89)
        tabBar.tintColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)
    }
}
