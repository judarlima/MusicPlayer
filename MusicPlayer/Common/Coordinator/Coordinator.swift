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
        let playlistViewContoller = PlaylistViewController()
        navigationController.pushViewController(playlistViewContoller, animated: false)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

