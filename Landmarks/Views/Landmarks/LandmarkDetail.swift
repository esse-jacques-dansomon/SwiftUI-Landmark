//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Esse Jacques  on 09/01/2024.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    
    var landmark: Landmark
    
    var landmarkIindex: Int {
        modelData.landmarks.firstIndex(where: {
            $0.id == landmark.id
        })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            VStack {
                MapView(coordinate:  landmark.locationCoordinates)
                    .frame(height: 300)

                CircleImage(image: landmark.image)
                    .offset(y: -130)
                    .padding(.bottom, -130)

                VStack(alignment: .leading) {
                
                    
                    HStack{
                        Text(landmark.name)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        
                        FavoriteButton(isSet: $modelData.landmarks[landmarkIindex].isFavorite)
                    }

                    HStack {
                        Text(landmark.park)
                        Spacer()
                        Text(landmark.state)
                    }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                    Divider()

                    Text("About \(landmark.name)")
                        .font(.title2)
                    Text(landmark.description)
                }
                .padding()

                Spacer()
            }
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
        
}

#Preview {
    let modelData = ModelData()
    
  return  LandmarkDetail(landmark: ModelData().landmarks[0])
        .environment(modelData)
}
