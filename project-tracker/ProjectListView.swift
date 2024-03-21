//
//  ContentView.swift
//  project-tracker
//
//  Created by Joe Miehl on 3/20/24.
//

import SwiftUI

struct ProjectListView: View {
    var body: some View {
        VStack {
            Image("cross")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(Font.screenHeading)
                .foregroundStyle(Color("Purple"))
        }
        .padding()
    }
}

#Preview {
    ProjectListView()
}
