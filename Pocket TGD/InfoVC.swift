//
//  NewInfoVC.swift
//  Leaving Cert
//
//  Created by Richard Seaman on 08/09/2015.
//  Copyright (c) 2015 RichApps. All rights reserved.
//

import UIKit

class InfoVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var tableViewController = UITableViewController()
    
    // MARK: - System
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        // Make sure the nav bar image fits within the new orientation
        self.navigationItem.titleView = getNavImageView(toInterfaceOrientation)
        
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        let orientation:Int = UIDevice.currentDevice().orientation.rawValue
        if (orientation == Int(UIInterfaceOrientation.LandscapeLeft.rawValue) || orientation == Int(UIInterfaceOrientation.LandscapeRight.rawValue)) {
            return true
        }
        else {
            return navigationController?.navigationBarHidden == true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Apply tableview to Table View Controller (needed to get rid of blank space)
        tableViewController.tableView = tableView
        
        // Apply the row height
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 44.0;
        
        // Set up nav bar
        self.navigationItem.titleView = getNavImageView(UIApplication.sharedApplication().statusBarOrientation)
        
        // Get rid of the back button text (get rid of "Back")
        self.navigationController?.navigationBar.topItem?.title = ""
        
        // Prevent blank space appearing at top
        self.automaticallyAdjustsScrollViewInsets = true
        
    }
    
    
    // MARK: - Setup
    
    
    // MARK: - Button functions
    
    func contactRichardTapped() {
        print("Called: contactRichardTapped")
        
        UIApplication.sharedApplication().openURL(NSURL(string: "https://ie.linkedin.com/pub/richard-seaman/60/b11/9b4")!)
        
    }
    
    func websiteDoETapped() {
        print("Called: websiteDoETapped")
        
        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.environ.ie/en/")!)
        
    }
    
    func websiteDoESTapped() {
        print("Called: websiteDoESTapped")
        
        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.education.ie/en/School-Design/")!)
        
    }
    
    
    // MARK: - Tableview methods
    
    // Assign the rows per section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //println("Determining rows in section")
        
        switch section {
            
        case 0: // About
            return 1
        case 1: // Features
            return 1
        case 2: // Contact
            return 2
        case 3: // Disclaimer
            return 1
        case 4: // Copyright
            return 2
        default:
            print("This section should not be here")
            return 0
            
        }
        
    }
    
    // Determine Number of sections
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        
        return 5
        
    }
    
    // Set properties of section header
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        returnHeader(view)
        
    }
    
    // Assign Section Header Text
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        
        let headings:[String] = ["About","Features","Contact","Disclaimer","Copyright"]
        
        return headings[section]
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Set the properties that are true for all or majority
        var cell:UITableViewCell = UITableViewCell()
        
        switch indexPath.section {
            
        case 0:
            // First Section - About
            switch indexPath.row {
                
            case 0:
                // First Row
                cell = tableView.dequeueReusableCellWithIdentifier("CenterTextCell") as UITableViewCell!
                
                // Grab the elements using the tag
                let label = cell.viewWithTag(1) as! UILabel
                
                let versionString:String = getVersion()
                
                // Set the elements
                label.text = "Pocket TGD is a reference application that was produced to assist designers of schools in Ireland.\n\nVersion \(versionString)\n\n© 2016 Richard Seaman. All rights reserved."
                cell.accessoryType = UITableViewCellAccessoryType.None
                cell.selectionStyle = UITableViewCellSelectionStyle.None
                
                
            default:
                print("This indexPath should not be here section:\(indexPath.section) row:\(indexPath.row)")
            }
            
        case 1:
            
            // Second Section - Features
            switch indexPath.row {
                
            case 0:
                // Text Row
                cell = tableView.dequeueReusableCellWithIdentifier("CenterTextCell") as UITableViewCell!
                
                // Grab the elements using the tag
                let label = cell.viewWithTag(1) as! UILabel
                
                // Set the elements
                label.text = "This application offers an index to the various Department of the Environment (DoE) and Department of Education and Skills (DoES) Technical Guidance Documents (TGDs) and Room Layouts that are made available on the DoE and DoES websites. A simplified daylight factor calculator is also included.\n\nAdditional content and features may be added to later versions depending on the feedback received."
                
                cell.selectionStyle = UITableViewCellSelectionStyle.None
                
                
            default:
                print("This indexPath should not be here section:\(indexPath.section) row:\(indexPath.row)")
            }
            
        case 2:
            
            // Third Section - Contact
            switch indexPath.row {
                
            case 0:
                // Text Row
                cell = tableView.dequeueReusableCellWithIdentifier("CenterTextCell") as UITableViewCell!
                
                // Grab the elements using the tag
                let label = cell.viewWithTag(1) as! UILabel
                
                // Set the elements
                label.text = "If you wish to get in contact with me, you can use the button below to open my LinkedIn page in Safari.\n\nIf you spot a bug, notice any links that aren't working or just want to pass along some suggestions or feedback, I'd be delighted to hear from you."
                
                cell.selectionStyle = UITableViewCellSelectionStyle.None
                
            case 1:
                // Button Row
                cell = tableView.dequeueReusableCellWithIdentifier("SingleButtonCell") as UITableViewCell!
                
                // Grab the elements using the tag
                let button = cell.viewWithTag(1) as! UIButton
                
                // Set the elements
                button.addTarget(self, action: "contactRichardTapped", forControlEvents: UIControlEvents.TouchUpInside)
                button.setTitle("Contact Richard", forState: UIControlState.Normal)
                
                button.layer.backgroundColor = UIColor(red: 205/255, green: 28/255, blue: 1/255, alpha: 1.0).CGColor
                button.layer.cornerRadius = 2.5
                
                // Don't highlight background when tapped outside button
                cell.selectionStyle = UITableViewCellSelectionStyle.None
                
                
            default:
                print("This indexPath should not be here section:\(indexPath.section) row:\(indexPath.row)")
            }
            
        case 3:
            
            // Fourth Section - Disclaimer
            switch indexPath.row {
                
            case 0:
                // Text Row
                cell = tableView.dequeueReusableCellWithIdentifier("LeftTextCell") as UITableViewCell!
                
                // Grab the elements using the tag
                let label = cell.viewWithTag(1) as! UILabel
                
                // Set the elements
                label.text = "This application provides a link to documents that are held on the Department of the Environment and Department of Education and Skills websites. The documents linked to are the property of the respective Departments. The author of this app takes no responsibility for the accuracy or currency of the information provided and this application is used entirely at the user's own risk.\n\nThe author of this app takes no responsibility for any damage caused to the hardware that it is installed on or any responsibility for any loss of data or software that occurs as a result of its use.\n\nThis application is licensed as freeware and may be used without charge. The application and the concepts used are the intellectual property of its author."
                
                cell.selectionStyle = UITableViewCellSelectionStyle.None
                
                
                
                
            default:
                print("This indexPath should not be here section:\(indexPath.section) row:\(indexPath.row)")
            }
            
            
        case 4:
            
            // Fourth Section - Copyright
            switch indexPath.row {
                
            case 0:
                // Text Row
                cell = tableView.dequeueReusableCellWithIdentifier("CenterTextCell") as UITableViewCell!
                
                // Grab the elements using the tag
                let label = cell.viewWithTag(1) as! UILabel
                
                // Set the elements
                label.text = "The technical guidance documents and room layout drawings provided in this application are subject to Government copyright according to the Copyright and Related Rights Act, 2000.\n\nDoE TGD Source URL\nhttp://www.environ.ie/en/TGD/\n\nDoES TGD Source URL\nhttp://www.education.ie/en/School-Design/Technical-Guidance-Documents/\n\nDoES Room Layouts Source URL\nhttp://www.education.ie/en/School-Design/Design-Guidance/Room-Layouts.html\n\nTap buttons below to open in Safari"
                
                cell.selectionStyle = UITableViewCellSelectionStyle.None
                
            case 1:
                // Button Row
                cell = tableView.dequeueReusableCellWithIdentifier("DoubleButtonCell") as UITableViewCell!
                
                // Grab the elements using the tag
                let button = cell.viewWithTag(1) as! UIButton
                let button2 = cell.viewWithTag(2) as! UIButton
                
                // Set button 1
                button.addTarget(self, action: "websiteDoETapped", forControlEvents: UIControlEvents.TouchUpInside)
                button.setTitle("DoE", forState: UIControlState.Normal)
                
                button.layer.backgroundColor = UIColor(red: 205/255, green: 28/255, blue: 1/255, alpha: 1.0).CGColor
                button.layer.cornerRadius = 2.5
                
                // Set button 2
                button2.addTarget(self, action: "websiteDoESTapped", forControlEvents: UIControlEvents.TouchUpInside)
                button2.setTitle("DoES", forState: UIControlState.Normal)
                
                button2.layer.backgroundColor = UIColor(red: 205/255, green: 28/255, blue: 1/255, alpha: 1.0).CGColor
                button2.layer.cornerRadius = 2.5
                
                // Don't highlight background when tapped outside button
                cell.selectionStyle = UITableViewCellSelectionStyle.None
                
                
            default:
                print("This indexPath should not be here section:\(indexPath.section) row:\(indexPath.row)")
            }
           
        default:
            print("This section should not be here section:\(indexPath.section)")
            cell = UITableViewCell()
            
        }
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Animate de-selection regardless of cell...
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        
    }
    
    
    
}
