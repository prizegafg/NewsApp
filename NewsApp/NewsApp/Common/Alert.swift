//
//  Alert.swift
//  NewsApp
//
//  Created by MAYU on 30/12/23.
//

import Foundation
import UIKit

class Alert {
    static func showGeneralAlert(title: String, message: String, viewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        viewController.present(alertController, animated: true, completion: nil)
    }
}

