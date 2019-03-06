//
//  TrackViewModel.swift
//  MusicPlayer
//
//  Created by Judar Lima on 04/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

struct TrackViewModel {
    let songName: String
    let artist: String
    let artwork: String
}

extension TrackViewModel: Equatable {
    public static func ==(lhs: TrackViewModel, rhs: TrackViewModel) -> Bool {
        return lhs.artist == rhs.artist &&
            lhs.artwork == rhs.artwork &&
            lhs.songName == rhs.songName
    }
}
