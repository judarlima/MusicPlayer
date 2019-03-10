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
    private let manager: PlaylistProviderProtocol!
    private var playlist: Playlist?
    
    init(presenter: PlaylistPresenterProtocol, manager: PlaylistProviderProtocol) {
        self.presenter = presenter
        self.manager = manager
    }
    
    func seePlaylist() {
        manager.fetchTracks { [weak self] (result) in
            
            guard let interactor = self else { return }
            
            switch result {
                
            case let .success(playlist):
                interactor.playlist = playlist
                interactor.presenter.presentPlaylist(playlist: playlist)
                
            case let .failure(error):
                interactor.presenter.presentError(error: error)
            }
        }
    }
    
    func shufflePlaylist() {
        guard let shuffledPlaylist = manager.fetchShuffled()
            else {
                presenter.presentError(error: ServiceError.unknown("Error on shuffle track list."))
                return
        }
        presenter.presentPlaylist(playlist: shuffledPlaylist)
    }
}
