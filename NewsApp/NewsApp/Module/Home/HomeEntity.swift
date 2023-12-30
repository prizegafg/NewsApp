// 
//  HomeEntity.swift
//  NewsApp
//
//  Created by MAYU on 30/12/23.
//

import Foundation
import SwiftyJSON

// Top Headline
struct NewsResponseModel: Decodable {
    let status: String
    let totalResults: Int
    let articles: [ArticleModel]
}

struct ArticleModel: Decodable {
    let source: SourceModel
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

struct SourceModel: Decodable {
    let id: String?
    let name: String
}


// All Headline
struct AllHeadlineModel: Decodable {
    let status: String
    let totalResults: Int
    let articles: [AllArticleModel]
}

struct AllArticleModel: Decodable {
    let source: AllSourceModel
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

struct AllSourceModel: Decodable {
    let id: String?
    let name: String
}
