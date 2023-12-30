// 
//  DetailNewsWebView.swift
//  NewsApp
//
//  Created by MAYU on 31/12/23.
//

import UIKit
import WebKit

class DetailNewsWebView: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    //MARK: - Property DetailNewsWebView
    
    
    var presenter: VTPDetailNewsWebProtocol?
    var url: String?

    //MARK: - Lifecycle DetailNewsWebView
    override func viewDidLoad() {
        setUpView()
        setUpData()
    }
    
    //MARK: - Function DetailNewsWebView
    func setUpView(){
        LoadingIndicator.startAnimating()
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        if let url = URL(string: url ?? "https://www.google.com") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
        LoadingIndicator.stopAnimating()
        
    }
    
    func setUpData(){
        
    }
    

    //MARK: - Function Action DetailNewsWebView
    
    
}

    //MARK: - Extension DetailNewsWebView

extension DetailNewsWebView: PTVDetailNewsWebProtocol {

}
