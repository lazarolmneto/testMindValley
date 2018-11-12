//
//  PostService.swift
//  MindValeyTest
//
//  Created by Lazaro Neto on 09/11/2018.
//  Copyright © 2018 mindvaleyTest. All rights reserved.
//

import UIKit

extension WebService {
    
    func getPosts(resultResponse: @escaping ResultResponse<[Post]>) {
        NetworkManager.shared.request(url: WebService.Path.posts.path) { (networkResponse) in
            switch networkResponse.result {
            case .success(let value):
                print(value)
                if let data = value as? Data {
                    if let posts: [Post] = data.decodeToObject() {
                        resultResponse(true, posts, nil)
                    } else {
                        resultResponse(false, nil, self.createGeneriErrorForResponse())
                    }
                }
            case .failure(_, let error):
                print(error)
                resultResponse(false, nil, error)
            }
        }
    }
}
