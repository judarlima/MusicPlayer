//
//  Coordinator.swift
//  MusicPlayer
//
//  Created by Judar Lima on 04/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import UIKit

protocol CoordinatorProtocol {
    func start()
    var navigationController: UINavigationController { get }
}

class Coordinator: CoordinatorProtocol {
    let navigationController: UINavigationController
    
    func start() {
        let presenter = PlaylistPresenter()
        let manager = PlaylistManager()
        let interactor = PlaylistInteractor(presenter: presenter, manager: manager)
        let playlistViewContoller = PlaylistViewController(interactor: interactor)
        
        presenter.viewController = playlistViewContoller
        
        navigationController.navigationBar.tintColor = #colorLiteral(red: 0.4648635387, green: 0.32649225, blue: 0.4731030464, alpha: 1)
        navigationController.pushViewController(playlistViewContoller, animated: false)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.barTintColor = #colorLiteral(red: 0.4648635387, green: 0.32649225, blue: 0.4731030464, alpha: 1)

        navigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}

