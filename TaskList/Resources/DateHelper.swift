//
//  DateHelper.swift
//  TaskList
//
//  Created by Seth Danner on 8/6/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import Foundation

extension Date {
    
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self)
    }
    
}
