// 
//  HomeInteractor.swift
//  NewsApp
//
//  Created by MAYU on 30/12/23.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class HomeInteractor: PTIHomeProtocol {
    var presenter: ITPHomeProtocol?
    
    
    func getTopHeadline(key: String) {
        let apiUrl = "https://newsapi.org/v2/top-headlines"
        let parameters: [String: Any] = [
            "country": "us",
            "apiKey": key
        ]
        AF.request(apiUrl, method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                do {
                    let newsResponse = try json["articles"].rawData() // Fetch the "articles" array
                    let decoder = JSONDecoder()
                    let parsedResponse = try decoder.decode([ArticleModel].self, from: newsResponse)
                    print(parsedResponse)
                    self.presenter?.onSuccessGetTopHeadline(data: parsedResponse)
                    // Handle parsedResponse: [Article] as per your requirement
                } catch {
                    print("Decoding error: \(error)")
                    let stringError = ErrorString.errorToString(error)
                    self.presenter?.onFailedGet(message: stringError)
                }
                
                
                
            case .failure(let error):
                let stringError = AFErrorToString.convertToString(error)
                self.presenter?.onFailedGet(message: stringError)
            }
        }
    }
    
    func getAllNews(key: String, from: String, to: String) {
        let apiUrl = "https://newsapi.org/v2/everything"
        let parameters: [String: Any] = [
            "q": "Indonesia",
            "language": "id",
            "from": from,
            "to": to,
            "sortBy": "publishedAt",
            "apiKey": key
        ]
        AF.request(apiUrl, method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                do {
                    let newsResponse = try json["articles"].rawData() // Fetch the "articles" array
                    let decoder = JSONDecoder()
                    let parsedResponse = try decoder.decode([AllArticleModel].self, from: newsResponse)
                    
                    self.presenter?.onSuccessGetEverything(data: parsedResponse)

                } catch {
                    print("Decoding error: \(error)")
                    let stringError = ErrorString.errorToString(error)
                    self.presenter?.onFailedGet(message: stringError)
                }
                
                
                
            case .failure(let error):
                let stringError = AFErrorToString.convertToString(error)
                self.presenter?.onFailedGet(message: stringError)
            }
        }
    }
    
    
    
    
    
}

   
