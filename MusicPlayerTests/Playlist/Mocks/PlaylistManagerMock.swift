//
//  PlaylistManagerMock.swift
//  MusicPlayerTests
//
//  Created by Judar Lima on 06/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation
@testable import MusicPlayer

class PlaylistManagerMock: PlaylistManagerProtocol {
    var serviceError: ServiceError?
    var playlist: Playlist?
    
    func fetchTracks(completion: @escaping (Result<Playlist>) -> Void) {
        guard let error = serviceError else {
            self.playlist = PlaylistManagerMock.generatePlaylist()
            completion(.success(self.playlist!))
            return
        }
        completion(.failure(error))
    }
    
    func fetchShuffled() -> Playlist? {
        guard self.playlist != nil else { return nil }
        self.playlist?.tracks.shuffleTracks()
        return self.playlist
    }
    
    static func generatePlaylist() -> Playlist {
        return Playlist(artists: [generateArtistsModel()], tracks: [generateTrackModel()])
    }
    
    static func generateArtistsModel() -> Artist {
        return Artist(id: 10, name: "Froid", primaryGenre: "Rap", wrapperType: "artista")
    }
    
    static func generateTrackModel() -> Track {
        return Track(wrapperType: "track", id: 1, artistName: "Froid", name: "Pseudosocial",
                     artwork: URL(string: "path/imagem")!, primaryGenre: "Rap")
    }
}
