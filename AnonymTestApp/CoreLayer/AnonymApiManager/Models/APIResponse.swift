//
//  APIResponse.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

struct APIResponse<T: Codable>: Codable {
    var data: T?
}
