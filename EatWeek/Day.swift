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
    
    var breakfast: String
    var lunch: String
    var dinner: String
    var snack : String
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("days")
    
    init(breakfast: String, lunch: String, dinner: String, snack: String) {
        self.breakfast = breakfast
    self.lunch = lunch
    self.dinner = dinner
    self.snack = snack
        
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
    
    required init?(coder aDecoder: NSCoder) {
        breakfast = aDecoder.decodeObject(forKey: "breakfast") as! String
        lunch = aDecoder.decodeObject(forKey: "lunch") as! String
        dinner = aDecoder.decodeObject(forKey: "dinner") as! String
        snack = aDecoder.decodeObject(forKey: "snack") as! String
      }
   // self.init(breakfast: breakfast, lunch: lunch, dinner: dinner, snack: snack)

}
