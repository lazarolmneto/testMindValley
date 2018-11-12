//
//  Link.swift
//  MindValeyTest
//
//  Created by Lazaro Neto on 09/11/2018.
//  Copyright © 2018 mindvaleyTest. All rights reserved.
//

import UIKit

//    "links":{
//        "self":"https://api.unsplash.com/photos/4kQA1aQK8-Y",
//        "html":"http://unsplash.com/photos/4kQA1aQK8-Y",
//        "download":"http://unsplash.com/photos/4kQA1aQK8-Y/download"
//    }

class PostLink: NSObject, Codable {

    var imageSelf: String?
    var html: String?
    var download: String?
    
    enum CodingKeys: String, CodingKey {
        case imageSelf = "image_self"
        case html
        case download
    }
    
}
