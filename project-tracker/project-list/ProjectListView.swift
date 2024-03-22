//
//  ContentView.swift
//  project-tracker
//
//  Created by Joe Miehl on 3/20/24.
//

import SwiftUI

struct ProjectListView: View {
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
                        ProjectCardView()
                        ProjectCardView()
                        ProjectCardView()
                        
                        
                    }
                }
                
                Button(action: {
                    // Todo
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
    }
}

#Preview {
    ProjectListView()
}
