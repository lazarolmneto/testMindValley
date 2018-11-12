//
//  Category.swift
//  MindValeyTest
//
//  Created by Lazaro Neto on 09/11/2018.
//  Copyright © 2018 mindvaleyTest. All rights reserved.
//

import UIKit

//"id":4,
//"title":"Nature",
//"photo_count":46148,
//"links":{
//    "self":"https://api.unsplash.com/categories/4",
//    "photos":"https://api.unsplash.com/categories/4/photos"
//}

class Category: NSObject, Codable {

    
    var id: Int?
    var title: String?
    var photoCount: Int?
    var links: CategoryLink?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case photoCount = "photo_count"
        case links
    }
}
