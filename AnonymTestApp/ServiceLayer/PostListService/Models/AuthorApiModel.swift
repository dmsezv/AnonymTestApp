//
//  AuthorApiModel.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

struct AuthorApiModel: Codable {
    var id: String?
    var url: String?
    var name: String?
    var photo: PhotoApiModel?
}
