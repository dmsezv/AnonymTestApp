//
//  NetworkEnvironment.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

protocol NetworkEnvironmentProtocol: AnyObject {
    static var networkEnvironment: NetworkEnvironment { get }
}

extension NetworkEnvironmentProtocol {
    static var networkEnvironment: NetworkEnvironment { .dev }
}

enum NetworkEnvironment {
    case dev, prod
}
