//
//  PlaylistManagerTests.swift
//  MusicPlayerTests
//
//  Created by Judar Lima on 06/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import XCTest
@testable import MusicPlayer

class PlaylistProviderTests: XCTestCase {
    var sut: PlaylistProvider!
    var serviceMock: APIServiceMock!

    override func setUp() {
        serviceMock = APIServiceMock()
        sut = PlaylistProvider(service: serviceMock)
    }
    
    func test_fetch_playlist_when_APIService_returns_valid_data_then_returns_playlist() {
        let managerExpectation = expectation(description: #function)
        let expectedNumberOfArtists = 5
        let expectedNumberOfTracks = 25
        let expectedExistentArtirst = Artist(id: 1171421960,
                                             name: "Charlie and the Chewie Humans",
                                             primaryGenre: "Metal",
                                             wrapperType: "artist")
        let expectedExistentTrack = Track(wrapperType: "track",
                                          id: 779273552,
                                          artistName: "Bloco TótiOQue",
                                          name: "Promessas Rebeldes",
                                          artwork: URL(string: "https://firebasestorage.googleapis.com/v0/b/tw-exercicio-mobile.appspot.com/o/albums%2Fbloco-totioque-oxe-perda-nam.png?alt=media&token=83523399-83d2-4fb1-8a20-1d75dbb82568")!,
                                          primaryGenre: "Axé")
        var managerResult: Playlist?
        
        sut.fetchTracks { (result) in
            if case let .success(playlist) = result {
                managerResult = playlist
            } else {
                XCTFail("Result was not a success case.")
            }
            managerExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 0.3) { (_) in
            XCTAssertEqual(managerResult?.artists.count, expectedNumberOfArtists)
            XCTAssertEqual(managerResult?.tracks.count, expectedNumberOfTracks)
            XCTAssertTrue((managerResult?.artists.contains(expectedExistentArtirst))!)
            XCTAssertTrue((managerResult?.tracks.contains(expectedExistentTrack))!)
        }
    }
    
    func test_fetchShuffled_playlist_when_APIService_returns_valid_data_then_returns_playlist_shuffled() {
        let managerExpectation = expectation(description: #function)
        var managerResult: Playlist?
        
        sut.fetchTracks { (result) in
            if case let .success(playlist) = result {
                managerResult = playlist
            } else {
                XCTFail("Result was not a success case.")
            }
            managerExpectation.fulfill()
        }
        
        managerResult = sut.fetchShuffled()
        
        waitForExpectations(timeout: 0.3) { (_) in
            var isNextArtistEqual: Bool = false
            let limit = (managerResult?.tracks.count)! - 1
            
            for i in 0 ..< limit {
                if i + 1 < limit {
                    let current = managerResult?.tracks[i]
                    let next = managerResult?.tracks[i + 1]
                    if current?.artistName == next?.artistName {
                        isNextArtistEqual = true
                    }
                }
            }
            XCTAssertFalse(isNextArtistEqual)
        }
    }

    func test_fetch_playlist_when_APIService_returns_serviceError_then_returns_serviceError() {
        let managerExpectation = expectation(description: #function)
        var managerResult: ServiceError?
        let expectedResult = ServiceError.brokenData

        serviceMock.serviceError = ServiceError.brokenData

        sut.fetchTracks { (result) in
            if case let .failure(error) = result {
                managerResult = error
            } else {
                XCTFail("Result was not a failure case.")
            }
            managerExpectation.fulfill()
        }

        waitForExpectations(timeout: 0.3) { (_) in
            XCTAssertEqual(managerResult?.localizedDescription, expectedResult.localizedDescription)
        }
    }
}
