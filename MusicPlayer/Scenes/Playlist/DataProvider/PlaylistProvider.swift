//
//  PlaylistManager.swift
//  MusicPlayer
//
//  Created by Judar Lima on 04/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

protocol PlaylistProviderProtocol {
    func fetchTracks(completion: @escaping (Result<Playlist>) -> Void)
    func fetchShuffled() -> Playlist?
}

class PlaylistProvider: PlaylistProviderProtocol {
    private let service: ServiceProtocol!
    private let choosenArtists = [909253, 358714030, 1171421960, 1419227, 264111789]
    private let limit = 5
    private var playlist: Playlist?
    
    init(service: ServiceProtocol = APIService()) {
        self.service = service
    }
    
    func fetchTracks(completion: @escaping (Result<Playlist>) -> Void) {
        service.requestData(with: PlaylistServiceSetup.tracksFromArtists(
            ids: choosenArtists, limit: limit)) { (result) in
                switch result {
                case let .success(data):
                    do {
                        let decoder = JSONDecoder()
                        let responseModel = try decoder.decode(LookupResponse.self, from: data)
                        let playlist = self.generatePlaylist(response: responseModel)
                        self.playlist = playlist
                        completion(.success(playlist))
                    } catch {
                        completion(.failure(.couldNotParseObject))
                    }
                case let .failure(error):
                    completion(.failure(error))
                }
        }
    }
    
    func fetchShuffled() -> Playlist? {
        guard self.playlist != nil else { return nil }
        self.playlist?.tracks.shuffleTracks()
        return self.playlist
    }
    
    private func generatePlaylist(response: LookupResponse) -> Playlist {
        let tracks = response.results.compactMap { wrapped -> Track? in
            switch wrapped {
            case let .track(track): return track
            default: return nil
            }
        }
        
        let artists = response.results.compactMap { wrapped -> Artist? in
            switch wrapped {
            case let .artist(artist): return artist
            default: return nil
            }
        }
        let playlist = Playlist(artists: artists, tracks: tracks)
        return playlist
    }
}
