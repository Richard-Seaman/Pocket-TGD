//
//  PDFVC.swift
//  BDP Reference App
//
//  Created by Richard Seaman on 30/03/2015.
//  Copyright (c) 2015 RichApps. All rights reserved.
//

import UIKit

class PDFVC: UIViewController {
    
    var path:NSURL = NSURL()

    @IBOutlet weak var webView: UIWebView!


    override func viewDidLoad() {
        super.viewDidLoad()

        self.webView.loadRequest(NSURLRequest(URL: path))
        
        // Prevent blank space appearing at top of webview
        self.automaticallyAdjustsScrollViewInsets = false
        
        /*
        // Example of how to load live pdf version
        let url : NSURL! = NSURL(string: "http://www.education.ie/en/School-Design/Technical-Guidance-Documents/TGD-030-Amendments-to-the-M-E-Building-Services-Guidelines-2004-TGD-002-ICT-Infrastructure-Guidelines-TGD-004-for-Primary-Schools-Revision-1-June-2014-.pdf")
        webView.loadRequest(NSURLRequest(URL: url))
        */
        
        
        // Set up nav bar
        self.navigationItem.titleView = getNavImageView(UIApplication.sharedApplication().statusBarOrientation)
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
    
    
    // MARK: - Navigation


}
