//
//  PlaylistInteractor.swift
//  MusicPlayer
//
//  Created by Judar Lima on 04/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

protocol PlaylistInteractorProtocol {
    func seePlaylist()
    func shufflePlaylist()
}

class PlaylistInteractor: PlaylistInteractorProtocol {
    private let presenter: PlaylistPresenterProtocol!
    private let manager: PlaylistManagerProtocol!
    
    init(presenter: PlaylistPresenterProtocol, manager: PlaylistManagerProtocol) {
        self.presenter = presenter
        self.manager = manager
    }
    
    func seePlaylist() {
        manager.fetchTracks { [weak self] (result) in
            
            guard let interactor = self else { return }
            
            switch result {
            
            case let .success(playlist):
                interactor.presenter.presentPlaylist(playlist: playlist)
                
            case let .failure(error):
                interactor.presenter.presentError(error: error)
            }
        }
    }
    
    func shufflePlaylist() { }
}


