//
//  PlaylistInteractorTests.swift
//  MusicPlayerTests
//
//  Created by Judar Lima on 06/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import XCTest
@testable import MusicPlayer

class PlaylistInteractorTests: XCTestCase {
    var presenterMock: PlaylistPresenterMock!
    var managerMock: PlaylistProviderMock!
    var sut: PlaylistInteractor!
    
    override func setUp() {
        managerMock = PlaylistProviderMock()
        presenterMock = PlaylistPresenterMock()
        sut = PlaylistInteractor(presenter: presenterMock,
                                 manager: managerMock)
    }
    
    func test_seePlaylist_when_manager_return_playlist_then_presenter_receives_a_playlist() {
        sut.seePlaylist()
        
        let expectedPlaylist = managerMock.playlist
        
        XCTAssertEqual(presenterMock.presentedList, expectedPlaylist)
        XCTAssertNil(presenterMock.presentedError)
    }
    
    func test_shufflePlaylist_when_manager_return_playlist_then_presenter_receives_a_playlist() {
        sut.seePlaylist()
        sut.shufflePlaylist()
        
        let expectedPlaylist = managerMock.playlist
        
        XCTAssertEqual(presenterMock.presentedList, expectedPlaylist)
        XCTAssertNil(presenterMock.presentedError)
    }
    
    func test_seePlaylist_when_manager_return_serviceError_then_presenter_receives_an_error() {
        let expectedPresentedError = ServiceError.couldNotFindHost
        
        managerMock.serviceError = ServiceError.couldNotFindHost
        
        sut.seePlaylist()
        
        XCTAssertEqual(presenterMock.presentedError!, expectedPresentedError)
        XCTAssertNil(presenterMock.presentedList)
    }
}
