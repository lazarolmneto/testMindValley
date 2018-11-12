//
//  UserProfileImage.swift
//  MindValeyTest
//
//  Created by Lazaro Neto on 09/11/2018.
//  Copyright © 2018 mindvaleyTest. All rights reserved.
//

import UIKit

class UserProfileImage: NSObject, Codable {

    var small: String?
    var medium: String?
    var large: String?
    
    enum CodingKeys: String, CodingKey {
        case small
        case medium
        case large
    }
}
