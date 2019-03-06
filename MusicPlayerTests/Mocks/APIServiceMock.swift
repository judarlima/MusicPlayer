//
//  APIServiceMock.swift
//  MusicPlayerTests
//
//  Created by Judar Lima on 06/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation
@testable import MusicPlayer

class APIServiceMock: ServiceProtocol {
    var serviceError: ServiceError? = nil
    
    func requestData(with setup: ServiceSetup, completion: @escaping (Result<Data>) -> Void) {
        guard let error = serviceError else {
            completion(.success(generateData()))
            return
        }
        if serviceError == ServiceError.couldNotParseObject {
            completion(.success(generateInvalidJsonData()))
        } else {
            completion(.failure(error))
        }
    }
    
    private func generateData() -> Data {
        guard let filePath = Bundle.main.path(forResource: "playlist", ofType: "json")
            else { fatalError("Could not mock data!") }
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: filePath),
                                    options: .mappedIfSafe)
            return jsonData
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    private func generateInvalidJsonData() -> Data {
        guard let filePath = Bundle.main.path(forResource: "invalidData", ofType: "json")
            else { fatalError("Could not mock data!") }
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: filePath),
                                    options: .mappedIfSafe)
            return jsonData
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
