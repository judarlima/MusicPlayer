//
//  PlaylistPresenterMock.swift
//  MusicPlayerTests
//
//  Created by Judar Lima on 06/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation
@testable import MusicPlayer

class PlaylistPresenterMock: PlaylistPresenterProtocol {
    var presentedList: Playlist?
    var presentedError: ServiceError?
    
    func presentPlaylist(playlist: Playlist) {
        presentedList = playlist
    }
    
    func presentError(error: ServiceError) {
        presentedError = error
    }
}
