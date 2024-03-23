//
//  AddProjectUpdateView.swift
//  project-tracker
//
//  Created by Joe Miehl on 3/23/24.
//

import SwiftUI

struct AddProjectUpdateView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    var project: Project
    var update: ProjectUpdate
    @State private var headline: String = ""
    @State var summary: String = ""
    @State var hours: String = ""
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading){
                Text("New Update")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                
                TextField("Headline", text: $headline)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Summary", text: $summary, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                
                
                HStack {
                    
                    TextField("Hours", text: $hours)
                        .keyboardType(.numberPad)
                        .frame(width: 60)

                    Spacer()
                    
                    Button("Save"){
                       //Save project
                        update.headline = headline
                        update.summary = summary
                        update.hours = Double(hours)!
                        
                        project.updates.insert(update, at: 0)
                        
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    
                }
                
                
                Spacer()
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
            .padding(.top)
        }
    }
}
