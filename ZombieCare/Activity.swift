//
//  Activity.swift
//  ZombieCare
//
//  Created by Chris Baxter on 09/06/2016.
//  Copyright © 2016 Catalyst Mobile Ltd. All rights reserved.
//

import CareKit

enum ActivityType: String {
        case Intervention
        case Assessment
}

enum ScheduleType: String {
    case Weekly
    case Daily
}

protocol Activity {
    
    var activityType: ActivityType { get set}
    
}

/**
 Struct that conforms to the Activity protocol to define either an intervention or assessment activity.
 */
struct ZCActivity : Activity {
    
    let identifier : String
    let title : String
    let text : String
    let startDate : Date
    let schedule : [NSNumber]
    let scheduleType : ScheduleType
    let instructions : String
    let imageURL : URL?
    var activityType: ActivityType
    
    init(fromJSON json: JSON, activityType: ActivityType) {
        self.identifier = json["identifier"].string!
        self.title = json["title"].string!
        self.instructions = json["instructions"].string!
        self.text = json["text"].string!
        if let imageString = json["imageURL"].string {
            self.imageURL = URL(string: imageString)
        }
        else {
            self.imageURL = nil
        }
        
        self.startDate = dateFromString(json["startdate"].string!)!
        self.scheduleType = ScheduleType(rawValue: json["scheduletype"].string!)!
        
        self.schedule = json["schedule"].string!.components(separatedBy: ",").map ( {
            NSNumber(value: Int32($0)! as Int32)
        })
        
        self.activityType = activityType
    }
    

    
 
}


