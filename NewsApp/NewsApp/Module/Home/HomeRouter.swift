// 
//  HomeRouter.swift
//  NewsApp
//
//  Created by MAYU on 30/12/23.
//

import UIKit

class HomeRouter: PTRHomeProtocol {
    
    static func createHomeModule() -> HomeView {
        let view =  HomeView()
        let presenter =  HomePresenter(viewController: view)
        let interactor : PTIHomeProtocol =  HomeInteractor()
        let router : PTRHomeProtocol =  HomeRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
    func navToDetail(data: [ArticleModel], nav: UINavigationController) {
        let vw = DetailNewsRouter.createDetailNewsModule()
        vw.dataNews = data
        vw.navFrom = .TopHeadline
        nav.pushViewController(vw, animated: true)
    }
    
    func navToDetailFromCell(data: [AllArticleModel], index: Int, nav: UINavigationController) {
        print("Succes to Router")
        let vw = DetailNewsRouter.createDetailNewsModule()
        vw.dataAllNews = data
        vw.indexNumb = index
        vw.navFrom = .AllHeadline
        nav.pushViewController(vw, animated: true)
    }
    
}

    
