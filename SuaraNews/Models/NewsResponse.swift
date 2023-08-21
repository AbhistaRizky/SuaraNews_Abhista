//
//  NewsResponse.swift
//  SuaraNews
//
//  Created by laptop MCO on 20/08/23.
//

import Foundation

struct NewsResponse: Codable {
    let data: [NewsData]
}

struct NewsData: Codable {
    let title: String
    let link: String
    let contentSnippet: String
    let isoDate: String
    let image: NewsImage   
}
