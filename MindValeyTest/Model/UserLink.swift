//
//  UserLink.swift
//  MindValeyTest
//
//  Created by Lazaro Neto on 09/11/2018.
//  Copyright © 2018 mindvaleyTest. All rights reserved.
//

import UIKit

class UserLink: NSObject, Codable {

    var imageSelf: String?
    var html: String?
    var photos: String?
    var likes: String?

    enum CodingKeys: String, CodingKey {
        case imageSelf = "self"
        case html
        case photos
        case likes
    }
}
