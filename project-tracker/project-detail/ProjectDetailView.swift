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
    @State private var update: ProjectUpdate?
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("Navy"), Color("Sky Blue")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            LinearGradient(colors: [Color("Washed Blue").opacity(0), Color("Sky Blue")], startPoint: .bottom, endPoint: .top)
                .frame(width: 1)
                .padding(.leading, -125)
            VStack{
                //Header
                VStack (alignment: .leading, spacing: 13) {
                    Text(project.name)
                        .font(.screenHeading)
                    
                    
                    HStack(alignment: .center, spacing: 13) {
                        Spacer()
                        StatBubbleView(title: "Hours", stat: "290", startColor: Color("Navy"), endColor: Color("Sky Blue"))
                        StatBubbleView(title: "Session", stat: "34", startColor: Color("Turtle Green"), endColor: Color("Lime"))
                        StatBubbleView(title: "Updates", stat: "32", startColor: Color("Maroon"), endColor: Color("Gem Purple"))
                        StatBubbleView(title: "Wins", stat: "9", startColor: Color("Maroon"), endColor: Color("Olive"))
                        Spacer()
                        
                        
                    }
                    
                    Text ("My current focus is...")
                        .font(.featuredText)
                    HStack{
                        Image(systemName: "checkmark.square")
                        Text ("Design the new website")
                            .font(.featuredText)
                    }
                    .padding(.leading)
                }
                .foregroundStyle(.white)
                .padding()
                .background {
                    Color.black
                        .opacity(0.7)
                        .clipShape(.rect(bottomLeadingRadius: 15, bottomTrailingRadius: 15))
                        .ignoresSafeArea()
                }
                
                //Project Updates
                ScrollView (showsIndicators: false){
                    VStack (spacing: 27) {
                        ForEach (project.updates) {update in
                        ProjectUpdateView(update: update)
                        }
                    }
                    .padding()
                    .padding(.bottom, 80)
                }
            }
            
            VStack{
                Spacer()
                HStack{
                    Button (action: {
                        //add project update
                        self.update = ProjectUpdate()
                    }, label: {
                        ZStack {
                            Circle()
                                .foregroundStyle(.black)
                                .frame(width: 65)
                            Image("cross")
                        }
                    })
                    .padding([.leading, .top])
                    Spacer()
                        
                        
                    Button("Back") {
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .foregroundStyle(.white)
                    .tint(.black)
                    .padding([.trailing, .top])
                }
                .background{
                    Color(.black)
                        .opacity(0.6)
                        .clipShape(.rect(topLeadingRadius: 15, topTrailingRadius: 15))
                        .ignoresSafeArea()
                }
            }
            
            
            
        }
        .navigationBarBackButtonHidden(true)
        .sheet(item: $update, content: { update in
            AddProjectUpdateView(project: project, update: update)
                .presentationDetents([.fraction(0.3)])
        })
        
        
    }
}


