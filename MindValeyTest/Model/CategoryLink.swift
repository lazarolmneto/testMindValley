//
//  CategoryUrl.swift
//  MindValeyTest
//
//  Created by Lazaro Neto on 09/11/2018.
//  Copyright © 2018 mindvaleyTest. All rights reserved.
//

import UIKit

//"links":{
//    "self":"https://api.unsplash.com/categories/4",
//    "photos":"https://api.unsplash.com/categories/4/photos"
//}

class CategoryLink: NSObject, Codable {

    var linkSelf: String?
    var photos: String?
    
    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
        case photos
    }
}
