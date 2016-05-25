//
//  RoomLayoutVC.swift
//  BDP Reference App
//
//  Created by Richard Seaman on 04/04/2015.
//  Copyright (c) 2015 RichApps. All rights reserved.
//

import UIKit

class RoomLayoutVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var selectedRoom:Room = Room()
    
    var school:Int = Int()
    var model:RoomLoader = RoomLoader()
    var roomArrays:[[Room]] = [[Room]]()
    var rooms:[Room] = [Room]()
    var sectionNames:[String] = [String]()
    
    // Table Variables
    var tableViewController = UITableViewController()
    let simpleTableIdentifier = "SimpleTableIdentifier"
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Apply tableview to Table View Controller (needed to get rid of blank space)
        tableViewController.tableView = tableView
        
        // Set up nav bar
        self.navigationItem.titleView = getNavImageView(UIApplication.sharedApplication().statusBarOrientation)
        
        // Determine which rooms to load
        if (school == 1) {
            // Post Primary School Selected
            self.model.loadPostPrimaryRooms()
            self.roomArrays = self.model.postPrimaryRoomArrays
            self.rooms = self.model.postPrimaryRooms
            self.sectionNames = self.model.postPrimarySectionNames
        }
        else {
            // Primary School Selected
            self.model.loadPrimaryRooms()
            self.roomArrays = self.model.primaryRoomArrays
            self.rooms = self.model.primaryRooms
            self.sectionNames = self.model.primarySectionNames
        }
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
        
        return roomArrays[section].count
        
    }
    
    // Determine Number of sections
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        
        return self.roomArrays.count
        
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
        
        // Determine the room to display
        let currentRoom:Room = self.roomArrays[indexPath.section][indexPath.row]
        
        // Set up the cell labels
        cell!.detailTextLabel?.numberOfLines = 1
                
        // Only include the area if its appropriate
        if (currentRoom.area == "Varies") {
            cell!.detailTextLabel?.text = String(format: "Area: %@ (%@)", currentRoom.area, currentRoom.date)
        }
        else if (currentRoom.area == "n/a") {
            cell!.detailTextLabel?.text = String(format: "(%@)", currentRoom.date)
        }
        else {
            cell!.detailTextLabel?.text = String(format: "Area: %@m2 (%@)", currentRoom.area, currentRoom.date)
        }
        
        cell!.textLabel?.text = currentRoom.name
        cell!.textLabel?.adjustsFontSizeToFitWidth = true
        
        return cell!
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Animate de-selection regardless of cell...
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        // Keep track of the selected Room
        self.selectedRoom = self.roomArrays[indexPath.section][indexPath.row]
        
        // Trigger the segue to go to the room pdf view
        self.performSegueWithIdentifier("toRoom", sender: self)
        
        
    }
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let newRoomPDFVC = segue.destinationViewController as! RoomPDFVC
        newRoomPDFVC.roomToDisplay = self.selectedRoom
        
    }

}
