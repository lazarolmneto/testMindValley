//
//  PostUrl.swift
//  MindValeyTest
//
//  Created by Lazaro Neto on 09/11/2018.
//  Copyright © 2018 mindvaleyTest. All rights reserved.
//

import UIKit

//"urls":{
//    "raw":"https://images.unsplash.com/photo-1464550883968-cec281c19761",
//    "full":"https://images.unsplash.com/photo-1464550883968-cec281c19761?ixlib=rb-0.3.5\u0026q=80\u0026fm=jpg\u0026crop=entropy\u0026s=4b142941bfd18159e2e4d166abcd0705",
//    "regular":"https://images.unsplash.com/photo-1464550883968-cec281c19761?ixlib=rb-0.3.5\u0026q=80\u0026fm=jpg\u0026crop=entropy\u0026w=1080\u0026fit=max\u0026s=1881cd689e10e5dca28839e68678f432",
//    "small":"https://images.unsplash.com/photo-1464550883968-cec281c19761?ixlib=rb-0.3.5\u0026q=80\u0026fm=jpg\u0026crop=entropy\u0026w=400\u0026fit=max\u0026s=d5682032c546a3520465f2965cde1cec",
//    "thumb":"https://images.unsplash.com/photo-1464550883968-cec281c19761?ixlib=rb-0.3.5\u0026q=80\u0026fm=jpg\u0026crop=entropy\u0026w=200\u0026fit=max\u0026s=9fba74be19d78b1aa2495c0200b9fbce"
//},

class PostUrl: NSObject, Codable {

    var raw: String?
    var full: String?
    var regular: String?
    var small: String?
    var thumb: String?
    
    enum CodingKeys: String, CodingKey {
        case raw
        case full
        case regular
        case small
        case thumb
    }
}
