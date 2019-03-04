//
//  WrappedType.swift
//  MusicPlayer
//
//  Created by Judar Lima on 04/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

enum WrappedType {
    case artist(Artist)
    case track(Track)    
}

extension WrappedType: Decodable {
    enum CodingKeys: String, CodingKey {
        case wrapperType
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .wrapperType)
        if type == "artist" {
            self = .artist(try Artist(from: decoder))
        } else {
            self = .track(try Track(from: decoder))
        }
    }
}
