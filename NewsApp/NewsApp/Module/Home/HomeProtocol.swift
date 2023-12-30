// 
//  HomeProtocol.swift
//  NewsApp
//
//  Created by MAYU on 30/12/23.
//

import UIKit

protocol VTPHomeProtocol: AnyObject {
    var view: PTVHomeProtocol? { get set }
    var interactor: PTIHomeProtocol? { get set }
    var router: PTRHomeProtocol? { get set }
    
    func startGetTopHeadline(key: String)
    func startGetAllNews(key: String)
    
    func startNavToDetail(data: [ArticleModel], nav: UINavigationController)
    func startNavToDetailFromCell(data: [AllArticleModel], index: Int, nav: UINavigationController)
    
}

protocol PTIHomeProtocol: AnyObject {
    var presenter: ITPHomeProtocol? { get set }
    
    func getTopHeadline(key: String)
    func getAllNews(key: String)

}

protocol ITPHomeProtocol: AnyObject {
    func onSuccessGetTopHeadline(data: [ArticleModel])
    func onSuccessGetEverything(data: [AllArticleModel])
    func onFailedGet(message: String)
    
}

protocol PTVHomeProtocol: AnyObject {
    func successGetTopHeadline(data: [ArticleModel])
    func successGetEverything(data: [AllArticleModel])
    func failedGet(message: String)
}

protocol PTRHomeProtocol: AnyObject {
    static func createHomeModule() -> HomeView
    func navToDetail(data: [ArticleModel], nav: UINavigationController)
    func navToDetailFromCell(data: [AllArticleModel], index: Int, nav: UINavigationController)
    
}
