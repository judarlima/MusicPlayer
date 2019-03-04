//
//  Artist.swift
//  MusicPlayer
//
//  Created by Judar Lima on 04/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

struct Artist {
    let id: Int
    let name: String
    let primaryGenre: String
    let wrapperType: String
}

extension Artist: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case wrapperType
        case primaryGenre = "primaryGenreName"
        case name = "artistName"
    }
}
