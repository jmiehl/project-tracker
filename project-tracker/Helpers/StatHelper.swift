//
//  StatHelper.swift
//  project-tracker
//
//  Created by Joe Miehl on 3/24/24.
//

import Foundation
import SwiftUI

struct StatHelper {
    
    static func updateAdded (project:Project, update: ProjectUpdate) {
        // change hours
        project.hours += update.hours
        
        //change wins
        if update.updateType == .milestone {
            project.wins += 1
        }
        
        //change session
        let sortedupdates = project.updates.sorted { u1, u2 in
            u1.date > u2.date
        }
        if sortedupdates.count >= 2 {
            // check if the latest two updates have the same date
            let date1 = sortedupdates[0].date
            let date2 = sortedupdates[1].date
            if !Calendar.current.isDate(date1, inSameDayAs: date2){
                // If not the same day, then that means latest update is first of today
                project.sessions += 1
            }
        } else {
            //Since there are less than 2 updates, then this is the first update today
            project.sessions += 1
        }
    }
    
    // run this AFTER update has been removed from project updates arrary
    static func updateDeleted (project: Project, update: ProjectUpdate) {
        
        //change hours
        project.hours -= update.hours
        
        //change wins
        if update.updateType == .milestone {
            project.wins -= 1
        }
        
        //change sessions
        let sameDayUpdates = project.updates.filter { u in
            Calendar.current.isDate(u.date, inSameDayAs: update.date)
        }
        if sameDayUpdates.count == 0 {
                // that means the deleted update is the only update of that day
            project.sessions -= 1
        }
    }
    
    static func updateEdited (project: Project, hoursDifference: Double) {
        //change hours
        project.hours += hoursDifference
        
        
    }
}
