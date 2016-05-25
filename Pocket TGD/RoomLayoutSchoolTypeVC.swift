//
//  RoomLayoutSchoolTypeVC.swift
//  BDP Reference App
//
//  Created by Richard Seaman on 04/04/2015.
//  Copyright (c) 2015 RichApps. All rights reserved.
//

import UIKit

class RoomLayoutSchoolTypeVC: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    // Table Variables
    var tableViewController = UITableViewController()
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    var selectedSchool:Int = Int()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Apply tableview to Table View Controller (needed to get rid of blank space)
        tableViewController.tableView = tableView
                
        // Set up nav bar
        self.navigationItem.titleView = getNavImageView(UIApplication.sharedApplication().statusBarOrientation)
    }
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        // Make sure the nav bar image fits within the new orientation
        self.navigationItem.titleView = getNavImageView(toInterfaceOrientation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Tableview delegate methods
    
    // Assign the rows per section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
        
    }
    
    // Determine Number of sections
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        
        return 1
    }
    
    // Assign Section Header Text
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        
        return "Select School Type"
        
    }
    
    // Set properties of section header
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView //recast your view as a UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColor(red: 205/255, green: 28/255, blue: 1/255, alpha: 1.0) //make the background BDP Red
        header.textLabel!.textColor = UIColor.whiteColor() //make the text white
        header.alpha = 0.8 //make the header transparent
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cellText:[String] = ["Primary Schools","Post-Primary Schools"]
        
        // Set up the cell type
        var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier)
            as UITableViewCell!
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: simpleTableIdentifier)
        }
        
        cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        // Set up the cell labels
        cell!.textLabel?.text = cellText[indexPath.row]
        cell!.textLabel?.adjustsFontSizeToFitWidth = true
        
        return cell!
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Animate de-selection regardless of cell...
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        // Keep track of the selected TGD
        self.selectedSchool = indexPath.row
        
        // Trigger the segue to go to the detail view
        self.performSegueWithIdentifier("toRoomLayouts", sender: self)
        
        
    }
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let newRoomLayoutVC = segue.destinationViewController as! RoomLayoutVC
        newRoomLayoutVC.school = self.selectedSchool
        
    }

}
