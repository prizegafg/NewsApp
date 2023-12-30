// 
//  DetailNewsWebRouter.swift
//  NewsApp
//
//  Created by MAYU on 31/12/23.
//

import UIKit

class DetailNewsWebRouter: PTRDetailNewsWebProtocol {
    
    //MARK: - Property DetailNewsWebRouter
    

    //MARK: - Lifecycle DetailNewsWebRouter
    
    
    //MARK: - Function DetailNewsWebRouter
    static func createDetailNewsWebModule() -> DetailNewsWebView {
        let view =  DetailNewsWebView()
        let presenter =  DetailNewsWebPresenter(viewController: view)
        let interactor : PTIDetailNewsWebProtocol =  DetailNewsWebInteractor()
        let router : PTRDetailNewsWebProtocol =  DetailNewsWebRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
}

    //MARK: - Extension DetailNewsWebRouter
