// 
//  HomePresenter.swift
//  NewsApp
//
//  Created by MAYU on 30/12/23.
//

import Foundation
import UIKit

class HomePresenter: VTPHomeProtocol {
    //MARK: - Property HomePresenter
    var view: PTVHomeProtocol?
    var interactor: PTIHomeProtocol?
    var router: PTRHomeProtocol?
    var viewController : HomeView!

    //MARK: - Lifecycle HomePresenter
    init() {}
    
    init(viewController: HomeView ) {
        self.viewController = viewController
    }
    
    //MARK: - Function HomePresenter
    
    func startGetTopHeadline(key: String) {
        interactor?.getTopHeadline(key: key)
    }
    
    func startGetAllNews(key: String) {
        interactor?.getAllNews(key: key)
    }
    
    func startNavToDetail(data: [ArticleModel], nav: UINavigationController) {
        router?.navToDetail(data: data, nav: nav)
    }
    
    func startNavToDetailFromCell(data: [AllArticleModel], index: Int, nav: UINavigationController) {
        router?.navToDetailFromCell(data: data, index: index, nav: nav)
    }
    
    
}

    //MARK: - Extension HomePresenter
extension  HomePresenter : ITPHomeProtocol {
    func onSuccessGetTopHeadline(data: [ArticleModel]) {
        view?.successGetTopHeadline(data: data)
    }
    
    func onSuccessGetEverything(data: [AllArticleModel]) {
        view?.successGetEverything(data: data)
    }
    
    func onFailedGet(message: String) {
        view?.failedGet(message: message)
    }
    

}
