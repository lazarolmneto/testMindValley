//
//  User.swift
//  MindValeyTest
//
//  Created by Lazaro Neto on 09/11/2018.
//  Copyright © 2018 mindvaleyTest. All rights reserved.
//

import UIKit

class User: NSObject, Codable {

    var id: String?
    var username: String?
    var name: String?
    var profileImage: UserProfileImage?
    var links: UserLink?
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case name
        case profileImage = "profile_image"
        case links
    }
}
