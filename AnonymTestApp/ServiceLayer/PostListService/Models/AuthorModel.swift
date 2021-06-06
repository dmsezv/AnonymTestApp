//
//  AuthorModel.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

struct AuthorModel: Codable {
    var id: String?
    var url: String?
    var name: String?
    var photo: PhotoModel?
}
