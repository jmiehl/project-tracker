//
//  EditFocusView.swift
//  project-tracker
//
//  Created by Joe Miehl on 3/23/24.
//

import SwiftUI

struct EditFocusView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    var project: Project
    @State var focus: String = ""
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading){
                Text("Edit Project Focus")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                HStack {
                    TextField("Focus", text: $focus)
                        .textFieldStyle(.roundedBorder)
                    Button("Save"){
                        //save the focus of the project
                        project.focus = focus
                        context.insert(project)
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
        }
    }
}
