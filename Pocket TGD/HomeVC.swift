//
//  HomeVC.swift
//  BDP Reference App
//
//  Created by Richard Seaman on 04/04/2015.
//  Copyright (c) 2015 RichApps. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var tgdButton: UIButton!
    @IBOutlet weak var spareButton: UIButton!
    @IBOutlet weak var roomLayoutsButton: UIButton!
    @IBOutlet weak var daylightCalculatorButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the Buttons
        var buttons:[UIButton] = [tgdButton, spareButton, roomLayoutsButton, daylightCalculatorButton]
        var index:Int = Int()
        for index = 0; index < buttons.count; index++ {
            buttons[index].layer.cornerRadius = 10
            buttons[index].layer.borderWidth = 1.2
            buttons[index].layer.borderColor = UIColor.blackColor().CGColor
            buttons[index].clipsToBounds = true
        }
        /*
        self.tgdButton.setTitle("TGD's", forState: UIControlState.Normal)
        self.spareButton.setTitle("Coming\nSoon...", forState: UIControlState.Normal)
        self.daylightCalculatorButton.setTitle("Daylight\nCalculator", forState: UIControlState.Normal)
        self.roomLayoutsButton.setTitle("Room\nLayouts", forState: UIControlState.Normal)
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
    

}
