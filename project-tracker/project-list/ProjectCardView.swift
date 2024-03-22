//
//  ProjectCardView.swift
//  project-tracker
//
//  Created by Joe Miehl on 3/21/24.
//

import SwiftUI

struct ProjectCardView: View {
    
    var body: some View {
        ZStack (alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .opacity(0.7)
                .shadow(radius: 5, x:0, y:4)
            VStack (alignment: .leading, spacing: 10) {
                Text("CodeWithJoe")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                    .padding(.top, 10)
                    .padding(.leading, 10)
                    
                
                HStack (alignment:.center, spacing: 13){
                    // ZStack project bubble
                    Spacer()
                    StatBubbleView(title: "Hours", stat: "290", startColor: Color("Navy"), endColor: Color("Blue"))
                    StatBubbleView(title: "Session", stat: "34", startColor: Color("Green"), endColor: Color("Lime"))
                    StatBubbleView(title: "Updates", stat: "32", startColor: Color("Maroon"), endColor: Color("Purple"))
                    StatBubbleView(title: "Wins", stat: "9", startColor: Color("Maroon"), endColor: Color("Olive"))
                    
                    Spacer()
                    
                }
                Text ("My current focus is...")
                    .font(.featuredText)
                    .foregroundStyle(Color.gray)
                    .padding(.leading, 10)
                
                Text ("Design the new website")
                    .font(.featuredText)
                    .foregroundStyle(Color.gray)
                    .bold()
                    .padding(.bottom, 10)
                    .padding(.leading, 10)
            }
        }
        .padding()
    }
}

#Preview {
    ProjectCardView()
}
