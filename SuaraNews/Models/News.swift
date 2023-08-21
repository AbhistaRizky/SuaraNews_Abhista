//
//  News.swift
//  SuaraNews
//
//  Created by laptop MCO on 20/08/23.
//

import Foundation

struct News: Identifiable {
    let id = UUID()
    let title: String
    let link: String         
    let contentSnippet: String
    let isoDate: String
    let image: NewsImage
}

struct NewsImage: Codable {
    let small: String
    let large: String
}
