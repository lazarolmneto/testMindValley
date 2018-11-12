//
//  PostViewModel.swift
//  MindValeyTest
//
//  Created by Lacir Moraes Neto, Lazaro on 09/11/18.
//  Copyright © 2018 mindvaleyTest. All rights reserved.
//

import UIKit

protocol PostViewModelDelegate {
    func didGetPosts()
    func didFaildGettingPosts(error: Error)
}

class PostViewModel: NSObject {

    private var posts = [Post]()
    var delegate: PostViewModelDelegate?
    
    func getPosts() {
        sharedWebService.getPosts { (success, posts, error) in
            if let posts = posts, success {
                self.posts = posts
                self.delegate?.didGetPosts()
            } else {
                self.delegate?.didFaildGettingPosts(error: error ?? sharedWebService.createGeneriErrorForResponse())
            }
        }
    }
    
    func getCount() -> Int{
        return self.posts.count
    }
    
    func getPostFor(index: Int) -> Post? {
        return self.posts[index]
    }
}
