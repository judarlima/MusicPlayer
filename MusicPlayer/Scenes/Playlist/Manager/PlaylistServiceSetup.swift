//
//  PlaylistServiceSetup.swift
//  MusicPlayer
//
//  Created by Judar Lima on 04/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

enum PlaylistServiceSetup: ServiceSetup {
    case tracksFromArtists(ids: [Int], limit: Int)
    
    var endpoint: String {
        switch self {
        case let .tracksFromArtists(ids, limit):
            let url = API.URL.base + API.Path.playlist
            return buildUrlString(url, ids: ids, limit: limit)
        }
    }
    
    private func buildUrlString(_ url: String, ids: [Int], limit: Int) -> String {
        var urlComponents = URLComponents(string: url)
        let idsString = ids.compactMap { String(describing: $0) }.joined(separator: ",")
        let limitString = String(limit)
        urlComponents?.queryItems = [URLQueryItem(name: "id", value: idsString),
                                     URLQueryItem(name: "limit", value: limitString)]
        guard let urlString = urlComponents?.url?.absoluteString else { return url }
        return urlString
    }
}
