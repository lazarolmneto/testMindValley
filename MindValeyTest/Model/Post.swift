//
//  Post.swift
//  MindValeyTest
//
//  Created by Lazaro Neto on 09/11/2018.
//  Copyright © 2018 mindvaleyTest. All rights reserved.
//

import UIKit

//{
//    "id":"4kQA1aQK8-Y",
//    "created_at":"2016-05-29T15:42:02-04:00",
//    "width":2448,
//    "height":1836,
//    "color":"#060607",
//    "likes":12,
//    "liked_by_user":false,
//    "user":{
//        "id":"OevW4fja2No",
//        "username":"nicholaskampouris",
//        "name":"Nicholas Kampouris",
//        "profile_image":{
//            "small":"https://images.unsplash.com/profile-1464495186405-68089dcd96c3?ixlib=rb-0.3.5\u0026q=80\u0026fm=jpg\u0026crop=faces\u0026fit=crop\u0026h=32\u0026w=32\u0026s=63f1d805cffccb834cf839c719d91702",
//            "medium":"https://images.unsplash.com/profile-1464495186405-68089dcd96c3?ixlib=rb-0.3.5\u0026q=80\u0026fm=jpg\u0026crop=faces\u0026fit=crop\u0026h=64\u0026w=64\u0026s=ef631d113179b3137f911a05fea56d23",
//            "large":"https://images.unsplash.com/profile-1464495186405-68089dcd96c3?ixlib=rb-0.3.5\u0026q=80\u0026fm=jpg\u0026crop=faces\u0026fit=crop\u0026h=128\u0026w=128\u0026s=622a88097cf6661f84cd8942d851d9a2"
//        },
//        "links":{
//            "self":"https://api.unsplash.com/users/nicholaskampouris",
//            "html":"http://unsplash.com/@nicholaskampouris",
//            "photos":"https://api.unsplash.com/users/nicholaskampouris/photos",
//            "likes":"https://api.unsplash.com/users/nicholaskampouris/likes"
//        }
//    },
//    "current_user_collections":[
//
//    ],
//    "urls":{
//        "raw":"https://images.unsplash.com/photo-1464550883968-cec281c19761",
//        "full":"https://images.unsplash.com/photo-1464550883968-cec281c19761?ixlib=rb-0.3.5\u0026q=80\u0026fm=jpg\u0026crop=entropy\u0026s=4b142941bfd18159e2e4d166abcd0705",
//        "regular":"https://images.unsplash.com/photo-1464550883968-cec281c19761?ixlib=rb-0.3.5\u0026q=80\u0026fm=jpg\u0026crop=entropy\u0026w=1080\u0026fit=max\u0026s=1881cd689e10e5dca28839e68678f432",
//        "small":"https://images.unsplash.com/photo-1464550883968-cec281c19761?ixlib=rb-0.3.5\u0026q=80\u0026fm=jpg\u0026crop=entropy\u0026w=400\u0026fit=max\u0026s=d5682032c546a3520465f2965cde1cec",
//        "thumb":"https://images.unsplash.com/photo-1464550883968-cec281c19761?ixlib=rb-0.3.5\u0026q=80\u0026fm=jpg\u0026crop=entropy\u0026w=200\u0026fit=max\u0026s=9fba74be19d78b1aa2495c0200b9fbce"
//    },
//    "categories":[
//    {
//    "id":4,
//    "title":"Nature",
//    "photo_count":46148,
//    "links":{
//    "self":"https://api.unsplash.com/categories/4",
//    "photos":"https://api.unsplash.com/categories/4/photos"
//    }
//    },
//    {
//    "id":6,
//    "title":"People",
//    "photo_count":15513,
//    "links":{
//    "self":"https://api.unsplash.com/categories/6",
//    "photos":"https://api.unsplash.com/categories/6/photos"
//    }
//    }
//    ],
//    "links":{
//        "self":"https://api.unsplash.com/photos/4kQA1aQK8-Y",
//        "html":"http://unsplash.com/photos/4kQA1aQK8-Y",
//        "download":"http://unsplash.com/photos/4kQA1aQK8-Y/download"
//    }
//}

class Post: NSObject, Codable {

    var id: String?
    var createdAt: String?
    var width: Double?
    var height: Double?
    var color: String?
    var likes: Int?
    var likedByUser: Bool?
    var user: User?
    var urls: PostUrl?
    var categories: [Category]?
    var links: PostLink?
    var currentUserCollection: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case width
        case height
        case color
        case likes
        case likedByUser = "liked_by_user"
        case user
        case urls
        case categories
        case links
        case currentUserCollection = "current_user_collections"
    }
}
