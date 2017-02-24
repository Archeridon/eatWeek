//
//  Day.swift
//  EatWeek
//
//  Created by Maddy Sutton on 2/22/17.
//  Copyright © 2017 Alexander Pacini. All rights reserved.
//

import Foundation
import UIKit
import os.log

class Day : NSObject {
    
    var nameDay: String

    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("days")
    
    init?(nameDay: String) {
        guard !nameDay.isEmpty else {
            return nil
}

    self.nameDay = nameDay
    }
    struct PropertyKey {
        static let nameDay = "nameDay"
}
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nameDay, forKey: PropertyKey.nameDay)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let nameDay = aDecoder.decodeObject(forKey: PropertyKey.nameDay) as? String else {
            os_log("unable", log: OSLog.default, type: .debug)
            return nil
        }


    self.init(nameDay: nameDay)

}
}
