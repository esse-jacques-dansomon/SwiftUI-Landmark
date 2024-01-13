//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Esse Jacques  on 12/01/2024.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    @Environment(ModelData.self) var modelData


        var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text(profile.username)
                        .bold()
                        .font(.title)


                    Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                    Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                    Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                    
                    Divider()
                    
                    VStack( alignment: .leading){
                        Text("Completed Bags")
                            .font(.headline)
                        
                        ScrollView(.horizontal){
                            HStack {
                               HikeBadge(name: "First Hike")
                                HikeBadge(name: "Eart Day").hueRotation(/*@START_MENU_TOKEN@*/Angle(degrees: 90)/*@END_MENU_TOKEN@*/)
                                HikeBadge(name: "Tenth Hike")
                                    .grayscale(/*@START_MENU_TOKEN@*/0.50/*@END_MENU_TOKEN@*/)
                                    .hueRotation(Angle(degrees: 45))
                            }
                        }
                    }
                    
                    
                }
                
                Divider()


                           VStack(alignment: .leading) {
                               Text("Recent Hikes")
                                   .font(.headline)


                               HikeView(hike: modelData.hikes[0])
                           }
            }
        }
}

#Preview {
    ProfileSummary(profile: Profile.default)
        .environment(ModelData())
}
