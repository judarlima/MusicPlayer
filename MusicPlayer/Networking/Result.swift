//
//  Result.swift
//  MusicPlayer
//
//  Created by Judar Lima on 04/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(ServiceError)
}
