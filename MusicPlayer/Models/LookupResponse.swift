//
//  Playlist.swift
//  MusicPlayer
//
//  Created by Judar Lima on 04/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

struct LookupResponse {
    let resultCount: Int
    let results: [WrappedType]
}

extension LookupResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case resultCount
        case results
    }    
}
