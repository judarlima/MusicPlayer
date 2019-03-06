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
        for i in 0 ..< limit {
            for key in dict.keys.shuffled() {
                guard let tracks = dict[key] else { return }
                result.append(tracks[i])
            }
        }
        self = result
    }
}
