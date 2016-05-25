//
//  RoomPDFVC.swift
//  BDP Reference App
//
//  Created by Richard Seaman on 04/04/2015.
//  Copyright (c) 2015 RichApps. All rights reserved.
//

import UIKit

class RoomPDFVC: UIViewController {
    
    var roomToDisplay:Room = Room()
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up nav bar
        self.navigationItem.titleView = getNavImageView(UIApplication.sharedApplication().statusBarOrientation)
        
        self.webView.loadRequest(NSURLRequest(URL: roomToDisplay.path))
        
        // Prevent blank space appearing at top of webview
        self.automaticallyAdjustsScrollViewInsets = false
        
    }
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        // Make sure the nav bar image fits within the new orientation
        self.navigationItem.titleView = getNavImageView(toInterfaceOrientation)
    }
    
    override func viewWillAppear(animated: Bool) {
        // Make sure the nav bar image fits within the new orientation
        if (UIDevice.currentDevice().orientation.isLandscape) {
            if (self.navigationItem.titleView?.frame.height > 400/16) {
                self.navigationItem.titleView = getNavImageView(UIApplication.sharedApplication().statusBarOrientation)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
