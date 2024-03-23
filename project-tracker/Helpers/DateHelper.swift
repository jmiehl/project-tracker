//
//  DateHelper.swift
//  project-tracker
//
//  Created by Joe Miehl on 3/23/24.
//

import Foundation

struct DateHelper {
    static func projectUpdateDate (inputDate: Date) -> String {
        let df = DateFormatter()
        
        df.dateFormat = "EEEE, MMM d, yyyy"
        return df.string(from: inputDate)
        
    }
}
