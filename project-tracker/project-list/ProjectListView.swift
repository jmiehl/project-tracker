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
                                    // using navigation link allows for moving to project detail
                                NavigationLink {
                                    // displays the project detail view
                                    ProjectDetailView(project: p)
                                } label: {
                                    // displays the poject card view
                                    ProjectCardView(project: p)
                                }
                                .buttonStyle(.plain)

                                
                               
                            }
                            
                            
                        }
                    }
                    
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
                }
                .padding()
            }
        }
        //displays a quarter sheet to create a new project based on binded variable $newProject
        .sheet(item: $newProject) { project in
            AddProjectView(project: project)
                .presentationDetents([.fraction(0.20)])
        }
    }
}

#Preview {
    ProjectListView()
}
