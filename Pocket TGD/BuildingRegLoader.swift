//
//  BuildingRegLoader.swift
//  Pocket Regs
//
//  Created by Richard Seaman on 19/04/2015.
//  Copyright (c) 2015 RichApps. All rights reserved.
//

import UIKit

// Object used to load the DoE Building Regs
class BuildingRegLoader: NSObject {
    
    // Note:
    // The section names must have the relevant part as their last string character
    // Once the regs have the current letter assigned to their part, they'll be put in the correct section
    
    var indexesForSectionRows:[[Int]] = [[Int](),[Int](),[Int](),[Int](),[Int](),[Int](),[Int](),[Int](),[Int](),[Int](),[Int](),[Int]()]
    var sectionNames:[String] = ["Part A", "Part B", "Part C", "Part D", "Part E", "Part F", "Part G", "Part H", "Part J", "Part K", "Part L", "Part M"]
    
    func loadBuildingRegs() -> [BuildingReg] {
        
        // Empty array for TGDs
        var arrayOfRegs:[BuildingReg] = [BuildingReg]()
        
        arrayOfRegs.append(self.setUpBuildingReg("Structure", date: "2012", pathString: "A", part: "A"))
        arrayOfRegs.append(self.setUpBuildingReg("Fire Safety", date: "2006", pathString: "B", part: "B"))
        arrayOfRegs.append(self.setUpBuildingReg("Site Prep. and Resistance to Moisture", date: "2004", pathString: "C", part: "C"))
        arrayOfRegs.append(self.setUpBuildingReg("Materials and Workmanship", date: "2013", pathString: "D", part: "D"))
        arrayOfRegs.append(self.setUpBuildingReg("Sound", date: "2014", pathString: "E", part: "E"))
        arrayOfRegs.append(self.setUpBuildingReg("Ventilation", date: "2009", pathString: "F", part: "F"))
        arrayOfRegs.append(self.setUpBuildingReg("Hygiene", date: "2008", pathString: "G", part: "G"))
        arrayOfRegs.append(self.setUpBuildingReg("Drainage and Waste Water Disposal", date: "2010", pathString: "H", part: "H"))
        arrayOfRegs.append(self.setUpBuildingReg("Heat Producing Appliances", date: "2014", pathString: "J", part: "J"))
        arrayOfRegs.append(self.setUpBuildingReg("Stairways, Ladders, Ramps and Guards", date: "2014", pathString: "K", part: "K"))
        arrayOfRegs.append(self.setUpBuildingReg("Conservation of Fuel and Energy", date: "2008", pathString: "L1", part: "L"))
        arrayOfRegs.append(self.setUpBuildingReg("Conservation of Fuel and Energy (Dwellings)", date: "2011", pathString: "L2", part: "L"))
        arrayOfRegs.append(self.setUpBuildingReg("Access and Use", date: "2010", pathString: "M", part: "M"))
        
        self.assignRegsToSectionIndexesArray(arrayOfRegs)
        
        return arrayOfRegs
        
    }
    
    func assignRegsToSectionIndexesArray(regs:[BuildingReg]) {
        
        // For each section
        var currentSection:Int = Int()
        for (currentSection = 0; currentSection < sectionNames.count; currentSection++) {
            
            // Check what the Part is for this section (last character in part string)
            let lastChar:String = sectionNames[currentSection].substringFromIndex(sectionNames[currentSection].endIndex.predecessor())
            
            // Loop through the Regs array and add any with the current Part
            var index:Int = Int()
            var indexInRegsArray:[Int] = [Int]()
            
            for (index = 0; index < regs.count; index++) {
                
                // track regs array index numbers that have part
                if (lastChar == regs[index].part) {
                    
                    indexInRegsArray.append(index)
                    
                }
                
                // add array of indexs to section row indexes array
                self.indexesForSectionRows[currentSection] = indexInRegsArray
            }
        }
        
    }
    
    
    func setUpBuildingReg(name:String, date:String, pathString:String, part:String) -> BuildingReg {
        
        let newReg:BuildingReg = BuildingReg()
        newReg.name = name
        newReg.pathString = pathString
        newReg.date = date
        newReg.part = part
        newReg.path = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(pathString, ofType: "pdf")!)
        
        return newReg
    }
    
}
