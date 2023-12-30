// 
//  DetailNewsProtocol.swift
//  NewsApp
//
//  Created by MAYU on 30/12/23.
//

import UIKit

protocol VTPDetailNewsProtocol: AnyObject {
    var view: PTVDetailNewsProtocol? { get set }
    var interactor: PTIDetailNewsProtocol? { get set }
    var router: PTRDetailNewsProtocol? { get set }
    
}

protocol PTVDetailNewsProtocol: AnyObject {
    
}

protocol PTIDetailNewsProtocol: AnyObject {
    var presenter: ITPDetailNewsProtocol? { get set }

}

protocol ITPDetailNewsProtocol: AnyObject {
    
}

protocol PTRDetailNewsProtocol: AnyObject {
    static func createDetailNewsModule() -> DetailNewsView
    
}
