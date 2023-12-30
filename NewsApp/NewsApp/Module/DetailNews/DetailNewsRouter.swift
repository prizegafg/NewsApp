// 
//  DetailNewsRouter.swift
//  NewsApp
//
//  Created by MAYU on 30/12/23.
//

import UIKit

class DetailNewsRouter: PTRDetailNewsProtocol {
    //MARK: - Function DetailNewsRouter
    static func createDetailNewsModule() -> DetailNewsView {
        let view =  DetailNewsView()
        let presenter =  DetailNewsPresenter(viewController: view)
        let interactor : PTIDetailNewsProtocol =  DetailNewsInteractor()
        let router : PTRDetailNewsProtocol =  DetailNewsRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
}

