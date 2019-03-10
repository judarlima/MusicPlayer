//
//  PlaylistPresenterTests.swift
//  MusicPlayerTests
//
//  Created by Judar Lima on 06/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import XCTest
@testable import MusicPlayer

class PlaylistPresenterTests: XCTestCase {
    var sut: PlaylistPresenter!
    var viewController: PlaylistViewControllerMock!
    
    override func setUp() {
        viewController = PlaylistViewControllerMock()
        sut = PlaylistPresenter()
        sut.viewController = viewController
    }
    
    func test_presentPlaylist_when_presenter_receives_a_playlist_model() {
        let playlistModel = PlaylistProviderMock.generatePlaylist()
        let expectedViewModel = PlayListViewModel(tracks: playlistModel.tracks
            .map { TrackViewModel(
                songName: $0.name,
                artist: $0.artistName + " (\($0.primaryGenre))",
                artwork: $0.artwork.absoluteString)
        })
        
        sut.presentPlaylist(playlist: playlistModel)
        
        XCTAssertEqual(viewController.presentedViewModel, expectedViewModel)
        XCTAssertNil(viewController.presentedErrorMessage)
    }
    
    func test_presentError_when_playlist_receives_an_error() {
        let serviceError = ServiceError.badRequest
        let expectedMessage = ServiceError.badRequest.localizedDescription
        
        sut.presentError(error: serviceError)
        
        XCTAssertEqual(viewController.presentedErrorMessage, expectedMessage)
        XCTAssertNil(viewController.presentedViewModel)
    }
}
