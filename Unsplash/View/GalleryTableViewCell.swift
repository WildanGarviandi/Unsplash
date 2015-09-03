//
//  GalleryTableViewCell.swift
//  Unsplash
//
//  Created by Wildan - Kurio on 9/3/15.
//  Copyright © 2015 Kellinreaver. All rights reserved.
//

import UIKit

class GalleryTableViewCell: UITableViewCell {

    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var fileNameLabel: UILabel!
    @IBOutlet var imageThumbnail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    internal func setContentCell(listObject: GalleryList) {
        let imageWidth = imageThumbnail.frame.size.width
        let imageHeight = imageThumbnail.frame.size.height
        let urlImage = "https://unsplash.it/\(imageWidth)/\(imageHeight)?image=\(listObject.id)"
        
        let imagePlaceholder = UIImage(named: "blur1")
        authorLabel.text = listObject.author
        fileNameLabel.text = listObject.filename
        imageThumbnail.setImageWithURL(NSURL(string: urlImage)!, placeholderImage:imagePlaceholder)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
