//
//  GalleryList.swift
//  Unsplash
//
//  Created by Wildan - Kurio on 9/3/15.
//  Copyright © 2015 Kellinreaver. All rights reserved.
//

import Foundation
import Argo
import Runes

struct GalleryList {
    let author: String
    let author_url: String
    let filename: String
    let format: String
    let id: Int
    let post_url: String?
}

extension GalleryList: Decodable {
    static func create(author: String)(author_url: String)(filename: String)(format: String)(id: Int)(post_url: String?) -> GalleryList {
        return GalleryList(author: author, author_url: author_url, filename: filename, format: format, id: id, post_url: post_url)
    }
    
    static func decode(j: JSON) -> Decoded<GalleryList> {
        return GalleryList.create
            <^> j <| "author"
            <*> j <| "author_url"
            <*> j <| "filename"
            <*> j <| "format"
            <*> j <| "id"
            <*> j <|? "post_url"
        
    }
}
