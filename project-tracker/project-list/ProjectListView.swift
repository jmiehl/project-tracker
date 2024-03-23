//
//  ContentView.swift
//  project-tracker
//
//  Created by Joe Miehl on 3/20/24.
//

import SwiftUI
import SwiftData
struct ProjectListView: View {
    
    
    @State private var newProject: Project?
    @Query private var projects: [Project]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("Deep Purple"), Color("Blush Pink")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack (alignment: .leading) {
                Text("Projects")
                    .font(.screenHeading)
                    .foregroundStyle(Color.white)
                
                ScrollView (showsIndicators: false) {
                    VStack (alignment: .leading, spacing: 26){
                        ForEach(projects) { p in
                            ProjectCardView(project: p)
                        }
                        
                        
                    }
                }
                
                Button(action: {
                    // create new project
                    self.newProject = Project()
                }, label: {
                    ZStack {
                        Circle()
                            .frame(width: 65)
                            .foregroundColor(.black)
                        Image("cross")
                    }
                })
            }
            .padding()
        }
        .sheet(item: $newProject) { project in
            AddProjectView(project: project)
                .presentationDetents([.fraction(0.20)])
        }
    }
}

#Preview {
    ProjectListView()
}
