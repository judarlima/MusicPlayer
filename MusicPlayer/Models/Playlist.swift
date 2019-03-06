//
//  Playlist.swift
//  MusicPlayer
//
//  Created by Judar Lima on 04/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

struct Playlist {
    let artists: [Artist]
    var tracks: [Track]
}

extension Playlist: Equatable {
    public static func ==(lhs: Playlist, rhs: Playlist) -> Bool {
        return lhs.artists == rhs.artists &&
            lhs.tracks == rhs.tracks
    }
}
