//
//  Model.swift
//  NewsRestApiApp
//
//  Created by Ece Ucak  on 16.11.2021.
//

import Foundation

struct APIResponse: Codable {
    let articles: [Article]
}

struct Article: Codable{
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}

struct Source: Codable{
    let name: String
}
