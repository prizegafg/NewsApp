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
        webView.navigationDelegate = self

        // Start observing the loading state of the web view
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)

        
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        if let url = URL(string: url ?? "https://www.google.com") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
    }
    
    func setUpData(){
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "isLoading" {
            if webView.isLoading {
                // Start animating the activity indicator when the web view starts loading
                LoadingIndicator.startAnimating()
            } else {
                // Stop animating the activity indicator when the web view finishes loading
                LoadingIndicator.stopAnimating()
            }
        }
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // Stop animating the activity indicator when the web view finishes loading
        LoadingIndicator.stopAnimating()
    }
    
    // Deinitialize the observers when the view is about to disappear
    
    
    deinit {
        webView.removeObserver(self, forKeyPath: #keyPath(WKWebView.isLoading))
    }
    

    
    
}

    //MARK: - Extension DetailNewsWebView

extension DetailNewsWebView: PTVDetailNewsWebProtocol {

}

extension DetailNewsWebView: WKNavigationDelegate{
    
}
