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
    func getData(by url: URL, complete: @escaping(Result<Data, Error>) -> Void)
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

        let task = session.dataTask(with: request as URLRequest) { data, _, error in
            if let error = error {
                complete(.failure(error))
            } else {
                guard let data = data else {
                    complete(.failure(ApiManagerError.dataNil))
                    return
                }
                guard
                    let dataResponse = try? JSONDecoder().decode(APIResponse<T>.self, from: data),
                    let dataModel = dataResponse.data else {
                    complete(.failure(ApiManagerError.jsonError))
                    return
                }

//                do {
//                    let dataResponse = try JSONDecoder().decode(APIResponse<T>.self, from: data)
//                    let dataModel = dataResponse.data!
//                    complete(.success(dataModel))
//                    } catch let DecodingError.dataCorrupted(context) {
//                        print(context)
//                    } catch let DecodingError.keyNotFound(key, context) {
//                        print("Key '\(key)' not found:", context.debugDescription)
//                        print("codingPath:", context.codingPath)
//                    } catch let DecodingError.valueNotFound(value, context) {
//                        print("Value '\(value)' not found:", context.debugDescription)
//                        print("codingPath:", context.codingPath)
//                    } catch let DecodingError.typeMismatch(type, context) {
//                        print("Type '\(type)' mismatch:", context.debugDescription)
//                        print("codingPath:", context.codingPath)
//                    } catch {
//                        print("error: ", error)
//                    }

                complete(.success(dataModel))
            }
        }

        task.resume()
    }

    func getData(by url: URL, complete: @escaping(Result<Data, Error>) -> Void) {
        let task = session.dataTask(with: url) { data, _, error in
            if let error = error {
                complete(.failure(error))
            } else {
                guard let data = data else {
                    complete(.failure(ApiManagerError.dataNil))
                    return
                }

                complete(.success(data))
            }
        }

        task.resume()
    }
}
