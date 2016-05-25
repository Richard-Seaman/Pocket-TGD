//
//  BuildingRegsVC.swift
//  Pocket Regs
//
//  Created by Richard Seaman on 19/04/2015.
//  Copyright (c) 2015 RichApps. All rights reserved.
//

import UIKit

class BuildingRegsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Table Variables
    var tableViewController = UITableViewController()
    let simpleTableIdentifier = "SimpleTableIdentifier"
    var sectionNames:[String] = [String]()
    var sectionRowIndexNumbersInRegsArray:[[Int]]=[[Int]]()
    
    @IBOutlet weak var tableView: UITableView!
    
    var regs:[BuildingReg] = [BuildingReg]()
    var model:BuildingRegLoader = BuildingRegLoader()
    var selectedReg:BuildingReg = BuildingReg()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Apply tableview to Table View Controller (needed to get rid of blank space)
        tableViewController.tableView = tableView
        
        self.regs = self.model.loadBuildingRegs()
        self.sectionNames = self.model.sectionNames
        self.sectionRowIndexNumbersInRegsArray = self.model.indexesForSectionRows
        
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
    
    
    // MARK: - Tableview delegate methods
    
    // Assign the rows per section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.sectionRowIndexNumbersInRegsArray[section].count
        
    }
    
    // Determine Number of sections
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        
        return self.sectionNames.count
    }
    
    // Assign Section Header Text
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        
        return self.sectionNames[section]
    }
    
    // Set properties of section header
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView //recast your view as a UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColor(red: 205/255, green: 28/255, blue: 1/255, alpha: 1.0) //make the background BDP Red
        header.textLabel!.textColor = UIColor.whiteColor() //make the text white
        header.alpha = 0.8 //make the header transparent
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Set up the cell type
        var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier)
            as UITableViewCell!
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: simpleTableIdentifier)
        }
        
        cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        let currentReg:BuildingReg = self.regs[sectionRowIndexNumbersInRegsArray[indexPath.section][indexPath.row]]
        
        // Set up the cell labels
        cell!.detailTextLabel?.numberOfLines = 1
        cell!.detailTextLabel?.text = String(format: "(%@)", currentReg.date)
        
        cell!.textLabel?.text = currentReg.name
        cell!.textLabel?.adjustsFontSizeToFitWidth = true
        
        return cell!
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Animate de-selection regardless of cell...
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        // Keep track of the selected TGD
        self.selectedReg = self.regs[sectionRowIndexNumbersInRegsArray[indexPath.section][indexPath.row]]
        
        // Trigger the segue to go to the detail view
        self.performSegueWithIdentifier("toPDF", sender: self)
        
    }
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let newPDFVC = segue.destinationViewController as! PDFVC
        newPDFVC.path = self.selectedReg.path
        
    }

}
