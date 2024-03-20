//
//  Project.swift
//  project-tracker
//
//  Created by Joe Miehl on 3/20/24.
//

import Foundation
import SwiftData

@Model
class Project: Identifiable {
    @Attribute(.unique) var id: String
    var name = ""
    var startDate = Date()
    var focus = ""
    @Relationship(deleteRule:.cascade, inverse: \ProjectUpdate.project)
    var update: [ProjectUpdate] = [ProjectUpdate]()
    
    init() {
        id = UUID().uuidString
    }
}
