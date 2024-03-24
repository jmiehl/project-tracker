//
//  ProjectCardView.swift
//  project-tracker
//
//  Created by Joe Miehl on 3/21/24.
//

import SwiftUI

struct ProjectCardView: View {
    var project: Project
    
    var body: some View {
        ZStack (alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .opacity(0.7)
                .shadow(radius: 5, x:0, y:4)
            VStack (alignment: .leading, spacing: 10) {
                Text(project.name)
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                    .padding(.top, 10)
                    .padding(.leading, 10)
                    
                
                HStack (alignment:.center, spacing: 13){
                    // ZStack project bubble
                    Spacer()
                    StatBubbleView(title: "Hours", stat: String(project.hours), startColor: Color("Navy"), endColor: Color("Sky Blue"))
                    StatBubbleView(title: "Session", stat: String(project.sessions), startColor: Color("Turtle Green"), endColor: Color("Lime"))
                    StatBubbleView(title: "Updates", stat: String(project.updates.count), startColor: Color("Maroon"), endColor: Color("Gem Purple"))
                    StatBubbleView(title: "Wins", stat: String(project.wins), startColor: Color("Maroon"), endColor: Color("Olive"))
                    
                    Spacer()
                    
                }
                
                if (project.focus.trimmingCharacters(in: .whitespacesAndNewlines) != "") {
                    Text ("My current focus is...")
                        .font(.featuredText)
                        .foregroundStyle(Color.gray)
                        .padding(.leading, 10)
                    
                    Text (project.focus)
                        .font(.featuredText)
                        .foregroundStyle(Color.gray)
                        .bold()
                        .padding(.bottom, 10)
                        .padding(.leading, 10)
                }
            }
        }
        .padding()
    }
}

