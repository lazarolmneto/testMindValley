//
//  PostsViewModelTest.swift
//  MindValeyTestUITests
//
//  Created by Lazaro Neto on 10/11/2018.
//  Copyright © 2018 mindvaleyTest. All rights reserved.
//

import XCTest


class PostsViewModelTest: XCTestCase {

    let viewModel = PostViewModel()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
//        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        self.viewModel.getPosts()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testInitalArraySizePosts() {
        let viewModel = PostViewModel()
        
        XCTAssertEqual(viewModel.getCount(), 0)
    }
    
    func testGetPosts() {
        sharedWebService.getPosts { (success, posts, error) in
            XCTAssertEqual(posts?.count, 10)
        }
    }
    
    func testFirstUserPost() {
        
        let urlT: String = "https://images.unsplash.com/photo-1464550883968-cec281c19761"
        
        sharedWebService.getPosts { (success, posts, error) in
            if let posts = posts,
                let first = posts.first,
                let urlStr = first.urls?.raw {
                XCTAssertEqual(urlStr, urlT)
            } else {
                XCTFail()
            }
        }
    }
}
