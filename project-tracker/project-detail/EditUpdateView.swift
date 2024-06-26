//
//  AddProjectUpdateView.swift
//  project-tracker
//
//  Created by Joe Miehl on 3/23/24.
//

import SwiftUI

struct EditUpdateView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    var project: Project
    var update: ProjectUpdate
    var isEditMode: Bool
    @State private var headline: String = ""
    @State private var summary: String = ""
    @State private var hours: String = ""
    @State private var showConfirmation = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading){
                Text(isEditMode ? "Edit Update" : "New Update")
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
                    
                    Button(isEditMode ? "Save" : "Save"){
                        
                        //keep track of difference in hours for an edit update
                        let hoursDifference = Double(hours)! - update.hours
                        update.headline = headline
                        update.summary = summary
                        update.hours = Double(hours)!
                        
                        if !isEditMode {
                            withAnimation {
                                //Add Project update
                                project.updates.insert(update, at: 0)
                                try? context.save()
                                // update stats
                                StatHelper.updateAdded(project: project, update: update)
                                
                            }
                        } else {
                            withAnimation {
                                //edit project update
                                // update stats
                                StatHelper.updateEdited(project: project, hoursDifference: hoursDifference)
                            }
                            
                        }
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    
                    if isEditMode {
                        Button("Delete") {
                            //Show confirmation dialog
                            showConfirmation = true
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                    
                }
                
                
                Spacer()
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
            .padding(.top)
        }
        .confirmationDialog("Are you sure you want to delete the update?", isPresented: $showConfirmation) {
            Button("Yes, Delete it") {
                withAnimation {
                    //remove all updates from the project with the same id
                    project.updates.removeAll {
                        u in  u.id == update.id
                    }
                    // force a a swiftdata save
                    try? context.save()
                    
                    StatHelper.updateDeleted(project: project, update: update)
                }
               
                dismiss()
            }
        }
        .onAppear(){
            headline = update.headline
            summary = update.summary
            hours = String(Int(update.hours))
        }
    }
}
