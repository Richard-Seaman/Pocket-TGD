//
//  TGDsVC.swift
//  BDP Reference App
//
//  Created by Richard Seaman on 30/03/2015.
//  Copyright (c) 2015 RichApps. All rights reserved.
//

import UIKit

class TGDsVC: UIViewController, UITableViewDelegate, UITableViewDataSource   {
    
    // Table Variables
    var tableViewController = UITableViewController()
    let simpleTableIdentifier = "SimpleTableIdentifier"
    var sectionNames:[String] = ["   M&E", "   Architectural", "   Structural"]     // Spaces needed to indent on this VC for some reason...?
    
    var TGDs:[TGD] = [TGD]()
    var model:TGDLoader = TGDLoader()
    var selectedTGD:TGD = TGD()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Apply tableview to Table View Controller (needed to get rid of blank space)
        tableViewController.tableView = tableView

        self.TGDs = self.model.loadTGDs()
        
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
        
        if (section == 0) {
            return self.model.firstSection
        }
        else if (section == 1) {
            return self.model.secondSection
        }
        else {
            return self.model.thirdSection
        }
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
        
        
        // Adjust the index array according to the section
        var index:Int = Int()
        if (indexPath.section == 0) {
            // Start at the beginning of the array
            index = 0
        }
        else if (indexPath.section == 1) {
            // Start at the beginning of the first section within array
            index = self.model.firstSection // (no need to minus one as array is 0 based and firstSection is a count)
        }
        else {
            // Start at the beginning of the second section within array
            index = self.model.firstSection + self.model.secondSection // ditto as above
        }
        
        // Set up the cell labels
        cell!.detailTextLabel?.numberOfLines = 1
        cell!.detailTextLabel?.text = String(format: "%@ (%@)", TGDs[indexPath.row+index].actualName, TGDs[indexPath.row+index].date )
        
        cell!.textLabel?.text = TGDs[indexPath.row+index].name
        cell!.textLabel?.adjustsFontSizeToFitWidth = true
        
        
        return cell!
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Animate de-selection regardless of cell...
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        // Adjust the index array according to the section
        var index:Int = Int()
        if (indexPath.section == 0) {
            // Start at the beginning of the array
            index = 0
        }
        else if (indexPath.section == 1) {
            // Start at the beginning of the first section within array
            index = self.model.firstSection // (no need to minus one as array is 0 based and firstSection is a count)
        }
        else {
            // Start at the beginning of the second section within array
            index = self.model.firstSection + self.model.secondSection // ditto as above
        }
        
        // Keep track of the selected TGD
        self.selectedTGD = self.TGDs[indexPath.row+index]
        
        // Trigger the segue to go to the detail view
        self.performSegueWithIdentifier("toTGD", sender: self)
        
        
    }
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let newPDFVC = segue.destinationViewController as! PDFVC
        newPDFVC.path = self.selectedTGD.path
        
    }

}
