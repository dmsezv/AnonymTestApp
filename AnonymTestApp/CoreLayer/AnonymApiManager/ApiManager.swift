//
//  ApiManager.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

protocol ApiManagerProtocol {
    func call<T: Codable>(endpoint: ApiEndpointItemProtocol,
                          parameters: [String: Any]?,
                          complete: @escaping(Result<T, Error>) -> Void)
}

enum ApiManagerError: Error {
    case badUrl, jsonError, dataNil
}

class ApiManager: ApiManagerProtocol, NetworkEnvironmentProtocol {
    private init() {}
    static let shared = ApiManager()

    private let session = URLSession.shared

    func call<T: Codable>(endpoint: ApiEndpointItemProtocol,
                          parameters: [String: Any]?,
                          complete: @escaping(Result<T, Error>) -> Void) {
        guard let url = endpoint.url else {
            complete(.failure(ApiManagerError.badUrl))
            return
        }

        let request: NSMutableURLRequest = NSMutableURLRequest(url: url)
        request.httpMethod = endpoint.httpMethod

        let task = session.dataTask(with: request as URLRequest) { data, response, error in
            if let error = error {
                complete(.failure(error))
            } else {
                guard let data = data else {
                    complete(.failure(ApiManagerError.dataNil))
                    return
                }
                guard let dataModel = try? JSONDecoder().decode(T.self, from: data) else {
                    complete(.failure(ApiManagerError.jsonError))
                    return
                }

                complete(.success(dataModel))
            }
        }

        task.resume()
    }
}
