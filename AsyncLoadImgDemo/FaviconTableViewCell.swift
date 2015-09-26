//
//  FaviconTableViewCell.swift
//  AsyncLoadImgDemo
//
//  Created by qingjiezhao on 9/25/15.
//  Copyright (c) 2015 qingjiezhao. All rights reserved.
//

import UIKit

class FaviconTableViewCell :UITableViewCell {
    //var operationQueue:NSOperationQueue?
    
    var url:NSURL? {
        didSet {
            self.textLabel?.text = self.url?.host
            
            let request = NSURLRequest(URL: self.url!)
            let session = NSURLSession.sharedSession()
            
            let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
                let image = UIImage(data: data!)
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    self.imageView?.image = image
                    self.setNeedsLayout()
                })
            }) as NSURLSessionDataTask
            
            dataTask.resume()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
