//
//  PostTableViewCell.swift
//  MindValeyTest
//
//  Created by Lacir Moraes Neto, Lazaro on 09/11/18.
//  Copyright © 2018 mindvaleyTest. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var labelTotalLikes: UILabel!
    @IBOutlet weak var iconHeartImage: UIImageView!
    @IBOutlet weak var imagePost: UIImageView!
    
    var post: Post! {
        didSet {
            self.fillLabels()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func fillLabels() {
        
        self.imageUser.layer.cornerRadius = self.imageUser.frame.height / 2
        self.imageUser.clipsToBounds = true
        
        self.labelUsername.text = self.post.user?.username
        
        self.labelTotalLikes.text = ""
        self.labelTotalLikes.isHidden = true
        self.iconHeartImage.isHidden = true
        
        if let totalLikes = self.post.likes, totalLikes > 0 {
            self.labelTotalLikes.text = "\(totalLikes) likes"
            self.labelTotalLikes.isHidden = false
            self.iconHeartImage.isHidden = false
        }
        
        self.imageUser.image = UIImage(named: "")
        if let userImage = self.post.user?.profileImage?.medium,
            !userImage.isEmpty {
            self.imageUser.setImage(url: userImage)
        }
        
        self.imagePost.image = nil
        if let postImage = self.post.urls?.regular,
            !postImage.isEmpty {
            self.imagePost.image = nil
            self.imagePost.setImage(url: postImage, replaceImage: UIImage(named: "icons8-no-camera-30"))
        }
    }
}
