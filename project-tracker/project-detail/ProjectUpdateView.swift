//
//  ProjectUpdateView.swift
//  project-tracker
//
//  Created by Joe Miehl on 3/23/24.
//

import SwiftUI

struct ProjectUpdateView: View {
    
    var update: ProjectUpdate
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.black)
                .shadow(radius: 5, x: 0, y: 4)
            
            
            VStack (alignment: .leading, spacing: 10) {
                HStack {
                    Text (DateHelper.projectUpdateDate(inputDate: update.date))
                        .padding(.leading)
                    Spacer()
                    
                    //Display star if milestone otherwise hours
                    if update.updateType == .milestone {
                        Image(systemName: "star.fill")
                            .padding(.trailing)
                            .foregroundStyle(.yellow)
                    } else {
                        Text ("\(String(Int(update.hours))) Hours ")
                            .padding(.trailing)
                    }
                }
                .padding(.vertical, 5)
                .background{
                    Color(update.updateType == .milestone ? "Tiffany Teal" : "Orchid")
                }
                Text (update.headline)
                    .font(.smallHeadline)
                    .padding(.horizontal)
                Text (update.summary)
                    .padding(.horizontal)
                    .padding(.bottom)
            }
            .foregroundStyle(.white)
            .font(.regularText)
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}


