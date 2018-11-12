//
//  DetailViewController.swift
//  MindValeyTest
//
//  Created by Lazaro Neto on 09/11/2018.
//  Copyright © 2018 mindvaleyTest. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelListCategories: UILabel!
    
    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillLabels()
    }
    
    func fillLabels() {
        
        self.scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 6.0
        
        self.imageUser.layer.cornerRadius = self.imageUser.frame.height / 2
        self.imageUser.clipsToBounds = true
        
        self.labelUsername.text = self.post.user?.username
        
        self.imageUser.image = UIImage(named: "")
        if let userImage = self.post.user?.profileImage?.medium,
            !userImage.isEmpty {
            self.imageUser.setImage(url: userImage)
        }
        
        self.imageView.image = nil
        if let postImage = self.post.urls?.full,
            !postImage.isEmpty {
            self.imageView.image = nil
            self.imageView.setImage(url: postImage, replaceImage: UIImage(named: "icons8-no-camera-30"))
        }
        
        if let categories = self.post.categories {
            var categoriesStr = ""
            for category in categories {
                if category == categories.first {
                    categoriesStr = "\(category.title ?? "")"
                } else {
                    categoriesStr = "\(categoriesStr), \(category.title ?? "")"
                }
            }
            self.labelListCategories.text = categoriesStr
        }
        
        //Formatter date
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let created = self.post.createdAt,
            let date = dateFormat.date(from: created) {
            dateFormat.dateFormat = "dd/MM/yyyy"
            self.labelDate.text = dateFormat.string(from: date)
        }
    }
}

//Mark : DetailViewController - ScrollViewDelegate
extension DetailViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        self.imageView.transform = CGAffineTransform.identity
        self.scrollView.contentSize = scrollView.frame.size
//        self.scrollView.layoutIfNeeded()
//        self.scrollView.layoutSubviews()
    }
}
