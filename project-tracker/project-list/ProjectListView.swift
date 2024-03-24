//
//  ContentView.swift
//  project-tracker
//
//  Created by Joe Miehl on 3/20/24.
//

import SwiftUI
import SwiftData
struct ProjectListView: View {
    
    
    @State private var newProject: Project? // variable to bind to sheet details
    @Query private var projects: [Project] //obtains the data for projects
    @State private var selectedProject: Project?
    
    var body: some View {
        NavigationStack {
            ZStack {
                // sets the background color using a gradient
                LinearGradient(colors: [Color("Deep Purple"), Color("Blush Pink")], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack (alignment: .leading) {
                    
                    // sets the title and formating
                    Text("Projects")
                        .font(.screenHeading)
                        .foregroundStyle(Color.white)
                    
                    ScrollView (showsIndicators: false) {
                        
                        // displays the projects
                        VStack (alignment: .leading, spacing: 26){
                            ForEach(projects) { p in
                                
                                ProjectCardView(project: p)
                                    .onTapGesture {
                                        selectedProject = p
                                    }
                                    .onLongPressGesture {
                                        newProject = p
                                    }
                            }
                            
                        }
                    }
                }
                .padding()
                VStack {
                    Spacer()
                    HStack {
                        Button(action: {
                            // create new project
                            self.newProject = Project()
                        }, label: {
                            ZStack {
                                // builds a custom button
                                Circle()
                                    .frame(width: 65)
                                    .foregroundColor(.black)
                                Image("cross")
                            }
                        })
                        Spacer()
                    }
                }
                .padding(.leading)
            }
            .navigationDestination(item: $selectedProject) { project in
                ProjectDetailView(project: project)
            }
        }
        //displays a quarter sheet to create a new project based on binded variable $newProject
        .sheet(item: $newProject) { project in
            
            // set isEdit to true if their is a project name
            let isEdit = project.name.trimmingCharacters(in: .whitespacesAndNewlines) != ""
            //Display edit view
            EditProjectView(project: project, isEditMode: isEdit)
                .presentationDetents([.fraction(0.20)])
        }
    }
}

