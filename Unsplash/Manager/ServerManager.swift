//
//  ServerManager.swift
//  Unsplash
//
//  Created by Wildan - Kurio on 9/3/15.
//  Copyright © 2015 Kellinreaver. All rights reserved.
//

import UIKit
import AFNetworking
import Argo

class ServerManager: NSObject {
    class var sharedInstance: ServerManager {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: ServerManager? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = ServerManager()
        }
        return Static.instance!
    }
    
    internal func getGalleryList(url: String, completion: (resultArray: NSArray) -> Void) {
        let manager = AFHTTPRequestOperationManager()
        manager.GET(url, parameters: nil, success: { (operation: AFHTTPRequestOperation, responseObject: AnyObject) -> Void in
            print(responseObject)
            completion(resultArray: responseObject as! NSArray)
            }) { (operation: AFHTTPRequestOperation, error: NSError) -> Void in
                print(error)
        }
    }
}
