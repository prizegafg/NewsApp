//
//  HomeTVC.swift
//  NewsApp
//
//  Created by MAYU on 30/12/23.
//

import UIKit
import Kingfisher

class HomeTVC: UITableViewCell {
    @IBOutlet weak var vwHomeTVC: UIView!
    @IBOutlet weak var imgHeadline: UIImageView!
    @IBOutlet weak var lblTitleHeadline: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblNoImage: UILabel!
    
    
    static let identifier = "HomeTVC"
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    var presenter: VTPHomeProtocol?
    var dataTo: [AllArticleModel] = []
    var parentViewController: UIViewController?
    var indexNumb: Int?
    var url: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        lblTitleHeadline.isUserInteractionEnabled = true
        lblTitleHeadline.addGestureRecognizer(tapGesture)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        if let viewController = parentViewController {
            if let navigation = viewController.navigationController{
//                let vw = DetailNewsRouter.createDetailNewsModule()
//                vw.dataAllNews = dataTo
//                vw.indexNumb = indexNumb ?? 0
//                vw.navFrom = .AllHeadline
                let vw = DetailNewsWebRouter.createDetailNewsWebModule()
                vw.url = url ?? ""
                navigation.pushViewController(vw, animated: true)
            }
        }
    }
    
    
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        lblTitleHeadline.text = ""
        lblAuthor.text = ""
        lblDate.text = ""
        imgHeadline.image = nil
        vwHomeTVC.layer.cornerRadius = 20
        imgHeadline.layer.cornerRadius = 20
    }
    
    func setUpData(dataCell: HomeTVCModel, index: Int ){
        lblTitleHeadline.text = dataCell.title
        lblAuthor.text = dataCell.author
        lblDate.text = DateConverter.convertDateString(dataCell.date)
        indexNumb = index
        url = dataCell.url
        if dataCell.image.isEmpty {
            lblNoImage.isHidden = false
            imgHeadline.isHidden = true
            lblNoImage.text = "No Image"
        } else {
            lblNoImage.isHidden = true
            imgHeadline.isHidden = false
            imgHeadline.kf.setImage(with: URL(string: dataCell.image))
        }
    }
    
    
    
}

struct HomeTVCModel{
    var title: String
    var author: String
    var date: String
    var image: String
    var url: String
    init(title: String, author: String, date: String, image: String, url: String) {
        self.title = title
        self.author = author
        self.date = date
        self.image = image
        self.url = url
    }
}
