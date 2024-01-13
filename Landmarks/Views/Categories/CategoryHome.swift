//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Esse Jacques  on 12/01//Users/essejacques.co/projects/learning/swift/courses/apple/BuildingListsAndNavigation/StartingPoint/Landmarks/Views2024.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    var body: some View {
        NavigationSplitView{
            List {
                modelData.features[0].image
                                   .resizable()
                                   .scaledToFill()
                                   .frame(height: 200)
                                   .clipped()
                                   .listRowInsets(EdgeInsets())

                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]! )
                }                    .listRowInsets(EdgeInsets())

            }
            .listStyle(.inset)
            .navigationTitle("Featured")
                .toolbar{
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("User profile", systemImage: "person.crop.circle")
                    }
                }.sheet(isPresented: $showingProfile){
                    ProfileHost()
                        .environment(modelData)
                }
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
