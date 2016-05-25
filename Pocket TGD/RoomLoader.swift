//
//  RoomLoader.swift
//  BDP Reference App
//
//  Created by Richard Seaman on 04/04/2015.
//  Copyright (c) 2015 RichApps. All rights reserved.
//

import UIKit

// Object used to load the DoES Room Layout Drawings
class RoomLoader: NSObject {
    
    // Post Primary School Variables
    // Names for section headers
    var postPrimarySectionNames:[String] = ["Classrooms","Engineering Rooms","Science Rooms", "Specialist Rooms", "GP", "PE", "Offices & Admin", "Support"]
    // Array for all rooms
    var postPrimaryRooms:[Room] = [Room]()
    // Arrays for types of rooms
    var postPrimaryScienceRooms:[Room] = [Room]()
    var postPrimaryEngineeringRooms:[Room] = [Room]()
    var postPrimaryClassrooms:[Room] = [Room]()
    var postPrimaryOfficesAndAdmin:[Room] = [Room]()
    var postPrimaryOtherSpecialist:[Room] = [Room]()
    var postPrimarySupport:[Room] = [Room]()
    var postPrimaryGP:[Room] = [Room]()
    var postPrimaryPE:[Room] = [Room]()
    // Array of arrays of rooms
    var postPrimaryRoomArrays:[[Room]] = [[Room]]()
    
    
    // Primary School Variables
    // Names for section headers
    var primarySectionNames:[String] = ["Classroom","Library & Resource Room","Offices", "Kitchenette Units"]
    // Array for all rooms
    var primaryRooms:[Room] = [Room]()
    // Arrays for types of rooms
    var primaryClassroom:[Room] = [Room]()
    var primaryLibrary:[Room] = [Room]()
    var primaryOffice:[Room] = [Room]()
    var primaryKitchenetteUnits:[Room] = [Room]()
    // Array of arrays of rooms
    var primaryRoomArrays:[[Room]] = [[Room]]()
    
    func loadPrimaryRooms() {
        
        // Classroom
        self.primaryClassroom.append(self.setupRoom("Plan", fileName: "P-Classroom-Plan", date: "January 2013", area: "80"))
        self.primaryClassroom.append(self.setupRoom("Elevations", fileName: "P-Classroom-Elevations", date: "January 2013", area: "n/a"))
        
        // Library
        self.primaryLibrary.append(self.setupRoom("Plan", fileName: "P-Library-Plan", date: "January 2013", area: "Varies"))
        self.primaryLibrary.append(self.setupRoom("Elevations", fileName: "P-Library-Elevations", date: "August 2012", area: "n/a"))
        
        // Offices
        self.primaryOffice.append(self.setupRoom("Admin / General", fileName: "P-Office", date: "January 2013", area: "Varies"))
        self.primaryOffice.append(self.setupRoom("Principal's", fileName: "P-PrincipalOffice", date: "January 2013", area: "Varies"))
        
        // Kitchenette Units
        self.primaryKitchenetteUnits.append(self.setupRoom("Servery / Multi-purpose Room", fileName: "P-ServeryMultiPurpose", date: "January 2013", area: "n/a"))
        self.primaryKitchenetteUnits.append(self.setupRoom("Staffroom", fileName: "P-Staffroom", date: "January 2013", area: "n/a"))
        
        // Add all of the room arrays to an array (so an array of arrays)
        // NB: This order determines the order of sections (if changed, change the order of section names above)
        self.primaryRoomArrays.append(self.primaryClassroom)
        self.primaryRoomArrays.append(self.primaryLibrary)
        self.primaryRoomArrays.append(self.primaryOffice)
        self.primaryRoomArrays.append(self.primaryKitchenetteUnits)
        
        // Add each individual room to the overall primaryRooms array
        var arrayIndex:Int = Int()
        for arrayIndex = 0; arrayIndex < self.primaryRoomArrays.count; arrayIndex++ {
            
            // for each of the array of rooms
            var index:Int = Int()
            for index = 0; index < self.primaryRoomArrays[arrayIndex].count; index++ {
                
                // for each of the rooms within the array
                self.primaryRooms.append(self.primaryRoomArrays[arrayIndex][index])
                
            }
        }
        
    }
    
    func loadPostPrimaryRooms() {
        
        // Science Rooms
        self.postPrimaryScienceRooms.append(self.setupRoom("Science Lab - Opt 1", fileName: "PP-ScienceLab1", date: "September 2011", area: "80"))
        self.postPrimaryScienceRooms.append(self.setupRoom("Science Lab - Opt 2", fileName: "PP-ScienceLab2", date: "September 2011", area: "80"))
        self.postPrimaryScienceRooms.append(self.setupRoom("Science Prep - Shallow Plan", fileName: "PP-SciencePrep1", date: "September 2011", area: "40"))
        self.postPrimaryScienceRooms.append(self.setupRoom("Science Prep - Deep Plan", fileName: "PP-SciencePrep2", date: "September 2011", area: "40"))
        self.postPrimaryScienceRooms.append(self.setupRoom("Science Prep - Single", fileName: "PP-SciencePrepSingle", date: "September 2011", area: "21"))
        self.postPrimaryScienceRooms.append(self.setupRoom("Demonstration Room", fileName: "PP-Demonstration", date: "September 2011", area: "63"))
        
        // Engineering Rooms
        self.postPrimaryEngineeringRooms.append(self.setupRoom("Construction Studies / Materials Technology", fileName: "PP-Construction", date: "September 2011", area: "136"))
        self.postPrimaryEngineeringRooms.append(self.setupRoom("Engineering / Metalwork", fileName: "PP-Engineering", date: "September 2011", area: "136"))
        self.postPrimaryEngineeringRooms.append(self.setupRoom("Technical Graphics", fileName: "PP-TechnicalGraphics", date: "September 2011", area: "80"))
        self.postPrimaryEngineeringRooms.append(self.setupRoom("Technology", fileName: "PP-Technology", date: "September 2011", area: "136"))
        self.postPrimaryEngineeringRooms.append(self.setupRoom("Wood / Technology Machine & Prep Area", fileName: "PP-WTMP", date: "September 2011", area: "65"))
        
        // Classrooms
        self.postPrimaryClassrooms.append(self.setupRoom("Business Studies / Commerce", fileName: "PP-BusinessStudies", date: "September 2011", area: "80"))
        self.postPrimaryClassrooms.append(self.setupRoom("General Classroom", fileName: "PP-GeneralClassroom", date: "September 2011", area: "49"))
        self.postPrimaryClassrooms.append(self.setupRoom("Guidance / Language / Business / Commerce", fileName: "PP-GLBC", date: "September 2011", area: "63"))
        self.postPrimaryClassrooms.append(self.setupRoom("Group Room", fileName: "PP-Group", date: "September 2011", area: "29"))
        self.postPrimaryClassrooms.append(self.setupRoom("Home School / Community Liason", fileName: "PP-HSCL", date: "September 2011", area: "49"))
        self.postPrimaryClassrooms.append(self.setupRoom("Learning Support - Opt 1", fileName: "PP-LearningSupport1", date: "September 2011", area: "55"))
        self.postPrimaryClassrooms.append(self.setupRoom("Learning Support - Opt 2", fileName: "PP-LearningSupport2", date: "September 2011", area: "63"))
        self.postPrimaryClassrooms.append(self.setupRoom("Lecture", fileName: "PP-Lecture", date: "September 2011", area: "109"))
        self.postPrimaryClassrooms.append(self.setupRoom("Maths / Social Studies", fileName: "PP-Maths", date: "September 2011", area: "63"))
        self.postPrimaryClassrooms.append(self.setupRoom("Religion & Meditation", fileName: "PP-Religion", date: "September 2011", area: "78"))
        
        // Offices
        self.postPrimaryOfficesAndAdmin.append(self.setupRoom("Chaplin / Guidance ", fileName: "PP-ChaplinOffice", date: "September 2011", area: "15"))
        self.postPrimaryOfficesAndAdmin.append(self.setupRoom("General - Opt 1", fileName: "PP-GeneralOffice1", date: "September 2011", area: "20"))
        self.postPrimaryOfficesAndAdmin.append(self.setupRoom("General - Opt 2", fileName: "PP-GeneralOffice2", date: "September 2011", area: "30"))
        self.postPrimaryOfficesAndAdmin.append(self.setupRoom("Meeting Room", fileName: "PP-MeetingRoom", date: "September 2011", area: "34"))
        self.postPrimaryOfficesAndAdmin.append(self.setupRoom("Pastoral", fileName: "PP-PastoralOffice", date: "September 2011", area: "10"))
        self.postPrimaryOfficesAndAdmin.append(self.setupRoom("Photocopy Room", fileName: "PP-PhotocopyRoom", date: "September 2011", area: "6"))
        self.postPrimaryOfficesAndAdmin.append(self.setupRoom("Principal's / Deputy's", fileName: "PP-PrincipalsOffice", date: "September 2011", area: "22"))
        
        // Other Specialist
        self.postPrimaryOtherSpecialist.append(self.setupRoom("Art / Craft", fileName: "PP-ArtCraft", date: "September 2011", area: "100"))
        self.postPrimaryOtherSpecialist.append(self.setupRoom("Commerce / Computer", fileName: "PP-Computer", date: "September 2011", area: "63"))
        self.postPrimaryOtherSpecialist.append(self.setupRoom("Design & Communication Graphics", fileName: "PP-DesignAndCommunicationGraphics", date: "September 2011", area: "80"))
        self.postPrimaryOtherSpecialist.append(self.setupRoom("Dress Design", fileName: "PP-DressDesign", date: "September 2011", area: "80"))
        self.postPrimaryOtherSpecialist.append(self.setupRoom("Home Economics", fileName: "PP-HomeEconomics", date: "September 2011", area: "100"))
        self.postPrimaryOtherSpecialist.append(self.setupRoom("Multimedia", fileName: "PP-Multimedia", date: "September 2011", area: "80"))
        
        // Support
        self.postPrimarySupport.append(self.setupRoom("Caretaker's Work Area", fileName: "PP-CaretakersWorkArea", date: "September 2011", area: "15"))
        self.postPrimarySupport.append(self.setupRoom("First Aid", fileName: "PP-FirstAid", date: "October 2010", area: "15"))
        self.postPrimarySupport.append(self.setupRoom("Library - Opt 1", fileName: "PP-Library1", date: "September 2011", area: "100"))
        self.postPrimarySupport.append(self.setupRoom("Library - Opt 2", fileName: "PP-Library2", date: "September 2011", area: "136"))
        self.postPrimarySupport.append(self.setupRoom("Project Store", fileName: "PP-ProjectStore", date: "September 2010", area: "60"))
        self.postPrimarySupport.append(self.setupRoom("Staffroom", fileName: "PP-StaffRoom", date: "September 2011", area: "120"))
        
        // GP
        self.postPrimaryGP.append(self.setupRoom("Dining Area", fileName: "PP-GPDiningArea", date: "September 2011", area: "180"))
        self.postPrimaryGP.append(self.setupRoom("Kitchenette", fileName: "PP-Kitchenette", date: "September 2011", area: "25"))
        self.postPrimaryGP.append(self.setupRoom("Music /Drama", fileName: "PP-MusicDrama", date: "September 2011", area: "80"))
        
        // PE
        self.postPrimaryPE.append(self.setupRoom("Fitness Suite Layout", fileName: "PP-GeneralFitnessSuite", date: "November 2011", area: "120"))
        self.postPrimaryPE.append(self.setupRoom("Control Centre", fileName: "PP-PEControlCentre", date: "September 2011", area: "9"))
        
        // Add all of the room arrays to an array (so an array of arrays)
        // NB: This order determines the order of sections (if changed, change the order of section names above)
        self.postPrimaryRoomArrays.append(self.postPrimaryClassrooms)
        self.postPrimaryRoomArrays.append(self.postPrimaryEngineeringRooms)
        self.postPrimaryRoomArrays.append(self.postPrimaryScienceRooms)
        self.postPrimaryRoomArrays.append(self.postPrimaryOtherSpecialist)
        self.postPrimaryRoomArrays.append(self.postPrimaryGP)
        self.postPrimaryRoomArrays.append(self.postPrimaryPE)
        self.postPrimaryRoomArrays.append(self.postPrimaryOfficesAndAdmin)
        self.postPrimaryRoomArrays.append(self.postPrimarySupport)
        
        // Add each individual room to the overall postPrimaryRooms array
        var arrayIndex:Int = Int()
        for arrayIndex = 0; arrayIndex < self.postPrimaryRoomArrays.count; arrayIndex++ {
            
            // for each of the array of rooms
            var index:Int = Int()
            for index = 0; index < self.postPrimaryRoomArrays[arrayIndex].count; index++ {
                
                // for each of the rooms within the array
                self.postPrimaryRooms.append(self.postPrimaryRoomArrays[arrayIndex][index])
                
            }
        }
        
    }
    
    func setupRoom(name:String, fileName:String, date:String, area:String) -> Room {
        
        let newRoom:Room = Room()
        
        newRoom.name = name
        newRoom.date = date
        newRoom.area = area
        newRoom.path = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(fileName, ofType: "pdf")!)
        
        return newRoom
        
    }
   
}
