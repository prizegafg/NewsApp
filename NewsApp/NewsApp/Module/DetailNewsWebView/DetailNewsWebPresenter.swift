// 
//  DetailNewsWebPresenter.swift
//  NewsApp
//
//  Created by MAYU on 31/12/23.
//

import Foundation
import UIKit

class DetailNewsWebPresenter: VTPDetailNewsWebProtocol {
    
    //MARK: - Property DetailNewsWebPresenter
    var view: PTVDetailNewsWebProtocol?
    var interactor: PTIDetailNewsWebProtocol?
    var router: PTRDetailNewsWebProtocol?
    var viewController : DetailNewsWebView!

    //MARK: - Lifecycle DetailNewsWebPresenter
    init() {}
    
    init(viewController: DetailNewsWebView ) {
        self.viewController = viewController
    }
    
    //MARK: - Function DetailNewsWebPresenter
    
    
}

    //MARK: - Extension DetailNewsWebPresenter
extension  DetailNewsWebPresenter : ITPDetailNewsWebProtocol {

}
