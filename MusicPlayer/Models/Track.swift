//
//  Track.swift
//  MusicPlayer
//
//  Created by Judar Lima on 04/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

struct Track {
    let wrapperType: String
    let id: Int
    let artistName: String
    let name: String
    let artwork: URL
    let primaryGenre: String
}

extension Track: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case wrapperType
        case artistName
        case name = "trackName"
        case artwork = "artworkUrl"
        case primaryGenre = "primaryGenreName"
    }
}

extension Track: Equatable {
    public static func ==(lhs: Track, rhs: Track) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.artistName == rhs.artistName &&
            lhs.primaryGenre == rhs.primaryGenre
    }
}
