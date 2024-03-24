//
//  ProjectDetailView.swift
//  project-tracker
//
//  Created by Joe Miehl on 3/23/24.
//

import SwiftUI
import SwiftData

struct ProjectDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    var project: Project
    @State private var newUpdate: ProjectUpdate?
    @State private var showEditFocus = false
    
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
                        StatBubbleView(title: "Hours", stat: String(project.hours), startColor: Color("Navy"), endColor: Color("Sky Blue"))
                        StatBubbleView(title: "Session", stat: String(project.sessions), startColor: Color("Turtle Green"), endColor: Color("Lime"))
                        StatBubbleView(title: "Updates", stat: String(project.updates.count), startColor: Color("Maroon"), endColor: Color("Gem Purple"))
                        StatBubbleView(title: "Wins", stat: String(project.wins), startColor: Color("Maroon"), endColor: Color("Olive"))
                        Spacer()
                        
                        
                    }
                    
                    Text ("My current focus is...")
                        .font(.featuredText)
                    HStack{
                        if (project.focus.trimmingCharacters(in: .whitespacesAndNewlines) != "") {
                            Button {
                                // complete this milestone
                                completeMilestone()
                            } label: {
                                Image(systemName: "checkmark.square")
                            }

                            
                        }
                        Text (project.focus.trimmingCharacters(in: .whitespacesAndNewlines) == "" ? "Tap to set your focus" : project.focus)
                            .font(.featuredText)
                            .onTapGesture {
                                // display edit focus form
                                showEditFocus = true
                            }
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
                        ForEach (project.updates.sorted(by: {u1, u2 in u1.date > u2.date})) {update in
                        ProjectUpdateView(update: update)
                                .onTapGesture {
                                    
                                }
                                .onLongPressGesture {
                                    newUpdate = update
                                }
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
                        newUpdate = ProjectUpdate()
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
        .sheet(item: $newUpdate) { update in
            let isEdit = update.headline.trimmingCharacters(in: .whitespacesAndNewlines) != ""
            EditUpdateView(project: project, update: update, isEditMode: isEdit)
                .presentationDetents([.fraction(0.3)])
        }
        .sheet(isPresented: $showEditFocus) {
            EditFocusView(project: project)
                .presentationDetents([.fraction(0.2)])
        }
        
        
    }
    
    func completeMilestone() {
        // create a new project update for the milestone
        let update = ProjectUpdate()
        update.updateType = .milestone
        update.headline = "Milestone Achieved"
        update.summary = project.focus
        project.updates.insert(update, at: 0) //saves the update
        
        //Force save
        try? context.save()
        
        //update stats
        StatHelper.updateAdded(project: project, update: update)
        
        
        //clear the current focus
        project.focus = ""
    }
}


