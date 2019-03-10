//
//  Array+Extensions.swift
//  MusicPlayer
//
//  Created by Judar Lima on 05/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

extension Array where Array.Element == Track {
    
    mutating func shuffleTracks() {
        var dict = [String: [Track]]()
        var result: [Track] = []
        self.shuffle()
        
        for track in self {
            if case nil = dict[track.artistName]?.append(track) {
                dict[track.artistName] = [track]
            }
        }
        
        let limit = count / dict.keys.count
        let keys = dict.keys.shuffled()
        for i in 0 ..< limit {
            keys.forEach {
                guard let tracks = dict[$0] else { return }
                result.append(tracks[i])
            }
        }
        self = result
    }
}
