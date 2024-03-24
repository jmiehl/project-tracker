//
//  AddProjectView.swift
//  project-tracker
//
//  Created by Joe Miehl on 3/22/24.
//

import SwiftUI
import SwiftData

struct EditProjectView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    
    
    var project: Project
    var isEditMode: Bool
    @State var projectName: String = ""
    @State private var showConfirmation: Bool = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading){
                Text(isEditMode ? "Edit Project" : "Add Project")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                HStack {
                    TextField("Project name", text: $projectName)
                        .textFieldStyle(.roundedBorder)
                    Button(isEditMode ? "Save" : "Add"){
                        if isEditMode {
                            //save the new project name
                            project.name = projectName
                        }
                        project.name = projectName
                        context.insert(project) // saves the project
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    .disabled(projectName.trimmingCharacters(in: .whitespacesAndNewlines) == "")
                    if isEditMode {
                        // show delete button
                        Button ("Delete") {
                            //show confirmation dialog
                            showConfirmation = true
                            
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
        }
        .confirmationDialog("Do you really want to delete", isPresented: $showConfirmation, titleVisibility: .visible) {
            Button("Yes, delete it") {
                //Delete project from SwiftData
                context.delete(project)
                dismiss()
            }
        }
        .onAppear() {
            projectName = project.name
        }
    }
}


