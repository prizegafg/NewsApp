// 
//  DetailNewsWebProtocol.swift
//  NewsApp
//
//  Created by MAYU on 31/12/23.
//

import UIKit

protocol VTPDetailNewsWebProtocol: AnyObject {
    var view: PTVDetailNewsWebProtocol? { get set }
    var interactor: PTIDetailNewsWebProtocol? { get set }
    var router: PTRDetailNewsWebProtocol? { get set }
    
}

protocol PTVDetailNewsWebProtocol: AnyObject {
    
}

protocol PTIDetailNewsWebProtocol: AnyObject {
    var presenter: ITPDetailNewsWebProtocol? { get set }

}

protocol ITPDetailNewsWebProtocol: AnyObject {
    
}

protocol PTRDetailNewsWebProtocol: AnyObject {
    static func createDetailNewsWebModule() -> DetailNewsWebView
    
}
