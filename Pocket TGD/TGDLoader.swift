//
//  TGDLoader.swift
//  BDP Reference App
//
//  Created by Richard Seaman on 01/04/2015.
//  Copyright (c) 2015 RichApps. All rights reserved.
//

import UIKit

// Object used to load the DoES TGDs
class TGDLoader: NSObject {
    
    // Track how many TGDs in each section
    var firstSection:Int = Int()
    var secondSection:Int = Int()
    var thirdSection:Int = Int()
    
    func loadTGDs() -> [TGD] {
        
        // Empty array for TGDs
        var arrayOfTGDs:[TGD] = [TGD]()
        
        // Set up the details of each TGD (order will determine table sections)
        
        // First Section - M&E
        arrayOfTGDs.append(self.setUpTGD("Temp Accomodation", date: "February 2004", number: "001"))
        arrayOfTGDs.append(self.setUpTGD("Primary Schools - Guidelines", date: "February 2004", number: "002"))
        arrayOfTGDs.append(self.setUpTGD("Primary Schools - ICT", date: "February 2004", number: "004"))
        arrayOfTGDs.append(self.setUpTGD("Primary Schools - Amendments", date: "June 2014", number: "030"))
        arrayOfTGDs.append(self.setUpTGD("Primary Schools - MWS", date: "June 2014", number: "030-1"))
        
        arrayOfTGDs.append(self.setUpTGD("Secondary Schools - Guidelines", date: "February 2004", number: "003"))
        arrayOfTGDs.append(self.setUpTGD("Secondary Schools - ICT", date: "February 2004", number: "005"))
        arrayOfTGDs.append(self.setUpTGD("Secondary Schools - Amendments", date: "June 2014", number: "031"))
        arrayOfTGDs.append(self.setUpTGD("Secondary Schools - MWS", date: "June 2014", number: "031-1"))
        
        arrayOfTGDs.append(self.setUpTGD("Dust Extract", date: "September 2012", number: "032"))
        self.firstSection = arrayOfTGDs.count
        
        // Second Section - Architectual
        arrayOfTGDs.append(self.setUpTGD("General Design Guidelines", date: "October 2011", number: "020"))
        arrayOfTGDs.append(self.setUpTGD("Construction Standards", date: "January 2008", number: "021"))
        arrayOfTGDs.append(self.setUpTGD("Specification of Windows", date: "April 2010", number: "021-1"))
        arrayOfTGDs.append(self.setUpTGD("Sanitary Facilities in Primary Schools", date: "April 2014", number: "021-2"))
        arrayOfTGDs.append(self.setUpTGD("Sanitary Facilities in Post-Primary Schools", date: "April 2014", number: "021-3"))
        arrayOfTGDs.append(self.setUpTGD("Acoustic Performance in Schools", date: "February 2013", number: "021-5"))
        arrayOfTGDs.append(self.setUpTGD("Post-Primary School Design Guidelines", date: "January 2008", number: "023"))
        arrayOfTGDs.append(self.setUpTGD("Sites for Primary Schools", date: "January 2012", number: "025"))
        arrayOfTGDs.append(self.setUpTGD("Special Education Needs (SEN)", date: "May 2012", number: "026"))
        self.secondSection = arrayOfTGDs.count - self.firstSection
        
        // Third Section - Structural
        arrayOfTGDs.append(self.setUpTGD("Structural Guidelines", date: "November 2012", number: "021-6"))
        self.thirdSection = arrayOfTGDs.count - self.secondSection - self.firstSection
        
        return arrayOfTGDs
    }
    
    func setUpTGD(name:String, date:String, number:String) -> TGD{
        
        let newTGD:TGD = TGD()
        newTGD.name = name
        newTGD.actualName = String(format: "TGD-%@", number)
        
        if (number == "021-1") {
            // this is the only .doc type
            newTGD.path = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(String(format: "TGD-%@", number), ofType: "doc")!)
        }
        else {
            // all else are .pdf type
            newTGD.path = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(String(format: "TGD-%@", number), ofType: "pdf")!)
            
        }
        newTGD.date = date
        newTGD.tgdNumber = number
        
        return newTGD
    }
   
}
