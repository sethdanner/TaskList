//
//  Task+Convenience.swift
//  TaskList
//
//  Created by Seth Danner on 8/1/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    
    convenience init(name: String, note: String? = nil, due: Date? = nil, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        
        self.name = name
        self.note = note
        self.due = due as Date?
    }
}
