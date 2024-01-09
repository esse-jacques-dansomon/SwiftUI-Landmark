//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Esse Jacques  on 09/01/2024.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    @Environment(ModelData.self) var modelData

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List{
                
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Farovrites only")
                })
                
                
                ForEach(filteredLandmarks){ landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
              
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList().environment(ModelData())
}
