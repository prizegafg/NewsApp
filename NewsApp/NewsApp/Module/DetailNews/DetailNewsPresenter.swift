// 
//  DetailNewsPresenter.swift
//  NewsApp
//
//  Created by MAYU on 30/12/23.
//

import Foundation
import UIKit

class DetailNewsPresenter: VTPDetailNewsProtocol {
    
    //MARK: - Property DetailNewsPresenter
    var view: PTVDetailNewsProtocol?
    var interactor: PTIDetailNewsProtocol?
    var router: PTRDetailNewsProtocol?
    var viewController : DetailNewsView!

    //MARK: - Lifecycle DetailNewsPresenter
    init() {}
    
    init(viewController: DetailNewsView ) {
        self.viewController = viewController
    }
    
    //MARK: - Function DetailNewsPresenter
    
    
}

    //MARK: - Extension DetailNewsPresenter
extension  DetailNewsPresenter : ITPDetailNewsProtocol {

}
