//
//  ProjectDetailView.swift
//  project-tracker
//
//  Created by Joe Miehl on 3/23/24.
//

import SwiftUI

struct ProjectDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    var project: Project
    
    var body: some View {
        VStack {
            Text(project.name)
                .navigationBarBackButtonHidden(true)
            
            Button("Back") {
                dismiss()
            }
        }
       
    }
}

#Preview {
    ProjectDetailView(project: Project())
}
