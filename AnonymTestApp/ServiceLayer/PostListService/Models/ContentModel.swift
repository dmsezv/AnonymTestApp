//
//  ContentModel.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

struct ContentModel: Codable {
    var data: ContentDataModel?
    var type: BannerTypeModel?
    var id: String?
}
