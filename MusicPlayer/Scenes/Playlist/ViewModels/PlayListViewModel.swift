//
//  PlayListViewModel.swift
//  MusicPlayer
//
//  Created by Judar Lima on 04/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

struct PlayListViewModel {
    let tracks: [TrackViewModel]
}

extension PlayListViewModel: Equatable {
    public static func ==(lhs: PlayListViewModel, rhs: PlayListViewModel) -> Bool {
        return lhs.tracks == rhs.tracks
    }
}
