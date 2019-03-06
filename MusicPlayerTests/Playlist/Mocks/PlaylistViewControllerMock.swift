//
//  PlaylistViewControllerMock.swift
//  MusicPlayerTests
//
//  Created by Judar Lima on 06/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation
@testable import MusicPlayer

class PlaylistViewControllerMock: PlaylistDisplayProtocol {
    var presentedViewModel: PlayListViewModel?
    var presentedErrorMessage: String?

    func displayError(message: String) {
        self.presentedErrorMessage = message
    }
    
    func displayPlaylist(viewModel: PlayListViewModel) {
        self.presentedViewModel = viewModel
    }
}

