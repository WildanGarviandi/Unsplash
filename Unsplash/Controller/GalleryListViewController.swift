//
//  GalleryListViewController.swift
//  Unsplash
//
//  Created by Wildan - Kurio on 9/3/15.
//  Copyright © 2015 Kellinreaver. All rights reserved.
//

import UIKit
import Argo

class GalleryListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var mainTableView: UITableView!
    
    var objectGallery = [GalleryList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataWithUrl("https://unsplash.it/list")
    }
    
    // MARK: get Data from server
    func getDataWithUrl(url: String) {
        let serverManager = ServerManager.sharedInstance
        serverManager.getGalleryList(url) { (resultArray) -> Void in
            self.objectGallery = decode(resultArray)!
            self.mainTableView.reloadData()
        }
    }
    
    // MARK: tableview implementation
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (objectGallery.count == 0) {
            return 1
        } else {
            return objectGallery.count;
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if (objectGallery.count == 0) {
            return self.view.frame.size.height
        } else {
            return 159
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellEmptyIdentifier = "loadingCell"
        let cellWithData = "GalleryCell"
        if (objectGallery.count == 0) {
            let cell = tableView.dequeueReusableCellWithIdentifier(cellEmptyIdentifier, forIndexPath: indexPath)
            
            return cell
        } else {
            let galleryCell = tableView.dequeueReusableCellWithIdentifier(
                cellWithData, forIndexPath: indexPath) as! GalleryTableViewCell
            
            galleryCell.setContentCell(objectGallery[indexPath.row])
            galleryCell.selectionStyle = UITableViewCellSelectionStyle.None
            
            return galleryCell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("pushToDetail", sender: indexPath)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let row = (sender as! NSIndexPath).row
        let detailVC = segue.destinationViewController as! DetailGalleryViewController
        detailVC.author = objectGallery[row].author
        detailVC.fileName = objectGallery[row].filename
        detailVC.authorUrl = objectGallery[row].author_url
        detailVC.imageId = objectGallery[row].id
    }

}
