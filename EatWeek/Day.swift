//
//  Day.swift
//  EatWeek
//
//  Created by Maddy Sutton on 2/22/17.
//  Copyright © 2017 Alexander Pacini. All rights reserved.
//

//import Foundation
import UIKit
import os.log

class Day : NSObject, NSCoding {
    
    var breakfast : String = ""
    var lunch : String = ""
    var dinner: String = ""
    var snack : String = ""
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("days")
    
    convenience init(breakfast: String, lunch: String, dinner: String, snack: String){
        self.init()
        self.breakfast = breakfast
        self.lunch = lunch
        self.dinner = dinner
        self.snack = snack
        
        
    }
    convenience init(breakfast: String) {
        self.init()
        self.breakfast = breakfast
    }

    
    struct PropertyKey {
        static let breakfast = "breakfast"
        static let lunch = "lunch"
        static let dinner = "dinner"
        static let snack = "snack"

}

    func encode(with aCoder: NSCoder) {
        aCoder.encode(breakfast, forKey: PropertyKey.breakfast)
        aCoder.encode(lunch, forKey: PropertyKey.lunch)
        aCoder.encode(dinner, forKey: PropertyKey.dinner)
        aCoder.encode(snack, forKey: PropertyKey.snack)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let breakfast = aDecoder.decodeObject(forKey: PropertyKey.breakfast) as? String else {
            os_log("unable", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let lunch = aDecoder.decodeObject(forKey: PropertyKey.lunch) as? String else {
            os_log("unable", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let dinner = aDecoder.decodeObject(forKey: PropertyKey.dinner) as? String else {
            os_log("unable", log: OSLog.default, type: .debug)
            return nil
        }
        guard let snack = aDecoder.decodeObject(forKey: PropertyKey.snack) as? String else {
            os_log("unable", log: OSLog.default, type: .debug)
            return nil
        }
        
        
        
        self.init(breakfast: breakfast, lunch: lunch, dinner: dinner, snack: snack)
        
    }
}
