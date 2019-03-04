//
//  PlaylistPresenter.swift
//  MusicPlayer
//
//  Created by Judar Lima on 04/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

protocol PlaylistPresenterProtocol {
    func presentPlaylist(playlist: Playlist)
    func presentShuffled(playlist: Playlist)
    func presentError(error: ServiceError)
}

class PlaylistPresenter: PlaylistPresenterProtocol {
    weak var viewController: PlaylistDisplayProtocol?
    
    func presentError(error: ServiceError) {
        viewController?.displayError(message: error.localizedDescription)
    }
    
    func presentPlaylist(playlist: Playlist) {
        let viewModel = PlayListViewModel(tracks: playlist.tracks.compactMap {
            return TrackViewModel(songName: $0.name,
                                  artist: $0.artistName + " (\($0.primaryGenre))", artwork: $0.artwork.absoluteString)
        })
        
        viewController?.displayPlaylist(viewModel: viewModel)
    }
    
    func presentShuffled(playlist: Playlist) { }
}
