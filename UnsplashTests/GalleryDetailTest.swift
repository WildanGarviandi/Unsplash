//
//  GalleryListTest.swift
//  Unsplash
//
//  Created by Wildan - Kurio on 9/4/15.
//  Copyright © 2015 Kellinreaver. All rights reserved.
//

import XCTest
@testable import Unsplash

class GalleryDetailTest: XCTestCase {
    
    var galleryVC: DetailGalleryViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        galleryVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewControllerWithIdentifier("DetailGalleryVC") as! DetailGalleryViewController
    }
    
    func testSetAuthorLabelText() {
        let modelMock = GalleryList(author: "author",
            author_url: "author_url",
            filename: "filename",
            format: "format",
            id: 0,
            post_url: "post_url")
        galleryVC.author = modelMock.author
        galleryVC.authorUrl = modelMock.author_url
        galleryVC.fileName = modelMock.filename
        galleryVC.imageId = modelMock.id
        
        XCTAssertNotNil(modelMock, "Should not nil")
        
        galleryVC.setDetailComponentAuthor(modelMock.author,
            fileName: modelMock.filename,
            authorUrl: modelMock.author_url,
            imageId: modelMock.id)
        XCTAssertTrue(galleryVC.authorLabel.text != nil, "The Author label should be set")
        XCTAssert(modelMock.author == galleryVC.authorLabel.text,
            "The Author label shoul be set with Author Field from object")
        
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(true, "Sample Test Pass")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}
