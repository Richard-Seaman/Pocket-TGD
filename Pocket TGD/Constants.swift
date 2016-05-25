//
//  Constants.swift
//  BDP Reference App
//
//  Created by Richard Seaman on 03/04/2015.
//  Copyright (c) 2015 RichApps. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    // There are a number of text fields used to input floats
    // This extension makes it easier to convert between string and float
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}


// MARK: - Daylight Calculator


// Defaults for calculator = [ceiling, floor, walls, glass, transmittance, VSA, DCF]
var daylightCalculatorDefaults:[Float] = [Float(), Float(), Float(), Float(), Float(), Float(), Float()]

// Reset the defaults to the built in defaults
func resetDaylightDefaults() {
    resetDaylightRoomProperties()
    resetDaylightWindowProperties()
}

func resetDaylightRoomProperties() {
    
    daylightCalculatorDefaults[0] = 80
    daylightCalculatorDefaults[1] = 40
    daylightCalculatorDefaults[2] = 70
    daylightCalculatorDefaults[3] = 10
    
}

func resetDaylightWindowProperties() {
    
    daylightCalculatorDefaults[4] = 77
    daylightCalculatorDefaults[5] = 90
    daylightCalculatorDefaults[6] = 0.9
    
}

// Attempt to load the user specified defaults, else load the built in defaults
func loadDaylightDefaults() {
    
    let filePath = dataFilePath()
    if (NSFileManager.defaultManager().fileExistsAtPath(filePath)) {
        let array = NSArray(contentsOfFile: filePath) as! [String]
        for var i:Int = 0; i < array.count; i++ {
            daylightCalculatorDefaults[i] = array[i].floatValue
        }
    }
    else {
        resetDaylightDefaults()
    }
    
    // print(daylightCalculatorDefaults)
}

// Get the path to the defaults file
func dataFilePath() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(
        NSSearchPathDirectory.DocumentDirectory,
        NSSearchPathDomainMask.UserDomainMask, true)
    let documentsDirectory = paths[0] as NSString
    return documentsDirectory.stringByAppendingPathComponent("defaults.plist") as String
}


// MARK: - Misc.

func getNavImageView(orientationToDisplayImageOn:UIInterfaceOrientation) -> UIImageView {
    
    // The navigation bar is shorter in landscape than portrait.
    // Change the size of the nav bar image so that it stays within the bar.
    
    var imageHeight:CGFloat = CGFloat()
    var imageWidth:CGFloat = CGFloat()
    
    if (orientationToDisplayImageOn == UIInterfaceOrientation.Portrait) {
        imageHeight = 400/12
        imageWidth = 400/12
    }
    else {
        imageHeight = 400/16
        imageWidth = 400/16
    }
    
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageHeight, height: imageWidth))
    imageView.contentMode = .ScaleAspectFit
    let image = UIImage(named: "Pocket TGD")
    imageView.image = image
    
    return imageView
    
}

let bdpColour = UIColor(red: 205/255, green: 28/255, blue: 1/255, alpha: 1)

func returnHeader(sender:UIView) -> UITableViewHeaderFooterView {
    
    let header: UITableViewHeaderFooterView = sender as! UITableViewHeaderFooterView //recast your view as a UITableViewHeaderFooterView
    header.textLabel!.textColor = UIColor.whiteColor() //make the text white
    
    header.alpha = 0.8 //make the header transparent
    header.contentView.backgroundColor = bdpColour    
    
    return header
}

func getVersion() -> String {
    if let version = NSBundle.mainBundle().infoDictionary?["CFBundleShortVersionString"] as? String {
        return version
    }
    return "no version info"
}




