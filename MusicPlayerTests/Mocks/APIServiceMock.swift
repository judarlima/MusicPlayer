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
    var fileName: String?
    
    func requestData(with setup: ServiceSetup, completion: @escaping (Result<Data>) -> Void) {
        guard let error = serviceError else {
            completion(.success(generateData()))
            return
        }
        if serviceError == ServiceError.couldNotParseObject {
            completion(.success(generateData()))
        } else {
            completion(.failure(error))
        }
    }
    
    private func generateData() -> Data {
        guard
            let filename = fileName,
            let filePath = Bundle.main.path(forResource: filename, ofType: "json")
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
