//
//  DetailGalleryViewController.swift
//  Unsplash
//
//  Created by Wildan - Kurio on 9/4/15.
//  Copyright © 2015 Kellinreaver. All rights reserved.
//

import UIKit

class DetailGalleryViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var fileNameLabel: UILabel!
    @IBOutlet var textViewUrlAuthor: UITextView!
    @IBOutlet var mainImage: UIImageView!
    
    var author: String!
    var fileName: String!
    var authorUrl: String!
    var imageId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewUrlAuthor.dataDetectorTypes = UIDataDetectorTypes.Link
        setDetailComponentAuthor(author, fileName: fileName, authorUrl: authorUrl, imageId: imageId)
    }
    
    func setDetailComponentAuthor(author:String, fileName:String, authorUrl:String, imageId:Int) {
        let imageWidth = self.view.frame.size.width
        let imageHeight = self.view.frame.size.height
        let urlImage = "https://unsplash.it/\(imageWidth)/\(imageHeight)?image=\(imageId)"
        authorLabel.text = author
        fileNameLabel.text = fileName
        authorLabel.text = author
        textViewUrlAuthor.text = authorUrl
        mainImage.setImageWithURL(NSURL(string: urlImage)!, placeholderImage: UIImage(named: "blur1"))
        mainImage.contentMode = .Redraw
    }
    
    func textView(textView: UITextView, shouldInteractWithURL URL: NSURL, inRange characterRange: NSRange) -> Bool {
        UIApplication.sharedApplication().openURL(URL)
        return true
    }
}
