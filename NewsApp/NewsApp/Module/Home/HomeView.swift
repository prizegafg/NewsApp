// 
//  HomeView.swift
//  NewsApp
//
//  Created by MAYU on 30/12/23.
//

import UIKit
import Kingfisher

class HomeView: UIViewController {
    @IBOutlet weak var imgTopHeadlines: UIImageView!
    @IBOutlet weak var vwHeadline: UIView!
    @IBOutlet weak var lblTitleHeadline: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var vwTableAllNews: UITableView!
    @IBOutlet weak var labelNoData: UILabel!
    
    var presenter: VTPHomeProtocol?
    var key = "0d4c8a4ec1fe491eb71a43cf4d420528"
    var dataArticle: [ArticleModel] = []
    var dataEverything: [AllArticleModel] = []
    var rowCount: Int? = 0
    override func viewDidLoad() {
        setUpView()
        setUpAction()
        setUpData()
    }
    
    //MARK: - Function HomeView
    func setUpView(){
        labelNoData.isHidden = true
//
        vwHeadline.layer.cornerRadius = 20
        imgTopHeadlines.layer.cornerRadius = 20
        vwTableAllNews.register(HomeTVC.nib(), forCellReuseIdentifier: HomeTVC.identifier)
        vwTableAllNews.delegate = self
        vwTableAllNews.dataSource = self
        vwTableAllNews.rowHeight = UITableView.automaticDimension
        vwTableAllNews.estimatedRowHeight = 100
        
        
    }
    
    func setUpAction(){
        lblTitleHeadline.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(lblTitleTapped(_:)))
        lblTitleHeadline.addGestureRecognizer(tapGesture)
    }
    
    func setUpData(){
        presenter?.startGetTopHeadline(key: key)
        presenter?.startGetAllNews(key: key)
        
    }
    
    @objc func lblTitleTapped(_ gesture: UITapGestureRecognizer) {
        print("OK OK OK")
        print("label successfully clicked")
        if let navigation = navigationController{
            presenter?.startNavToDetail(data: dataArticle, nav: navigation)
        }
    }
    
    
}

extension HomeView: PTVHomeProtocol {
    func successGetTopHeadline(data: [ArticleModel]) {
        dataArticle = data
        let firstArticle = data[0]
                
        lblTitleHeadline.text = firstArticle.title
        lblAuthor.text = firstArticle.author
        lblDate.text = DateConverter.convertDateString(firstArticle.publishedAt)
        if firstArticle.urlToImage == nil {
            imgTopHeadlines.isHidden = true
            labelNoData.isHidden = false
            labelNoData.text = "No Image Preview is Available"
        } else {
            labelNoData.isHidden = true
            imgTopHeadlines.kf.setImage(with: URL(string: firstArticle.urlToImage ?? ""))
            print(firstArticle.publishedAt)
        }
                
        
    }
    
    func successGetEverything(data: [AllArticleModel]) {
        dataEverything = data
        for _ in data {
            rowCount = (rowCount ?? 0)+1
        }
        vwTableAllNews.reloadData()
        print("success")
        
    }
    
    func failedGet(message: String) {
        print(message)
        Alert.showGeneralAlert(title: "Error", message: message, viewController: self)
        
    }
    

}

extension HomeView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTVC.identifier, for: indexPath) as! HomeTVC
        cell.dataTo = dataEverything
        cell.parentViewController = self
        
        if rowCount == 0 {
            print("OK")
        }else {
            let dataDetail = dataEverything[indexPath.row]
            print(dataDetail.title)
            let dataCell = HomeTVCModel(
                title: dataDetail.title,
                author: dataDetail.author ?? "",
                date: dataDetail.publishedAt,
                image: dataDetail.urlToImage ?? "")
            cell.setUpData(dataCell: dataCell, index: indexPath.row)
        }
        return cell
    }
    
}
