//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Esse Jacques  on 12/01/2024.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    var round = 15
    
    var body: some View {
        VStack(alignment: .leading){
            Text(categoryName).font(.headline)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top,spacing: 0){
                    ForEach(items) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark,  round: round)
                        }
                    }
                }
            }.frame(height: 185)
        }
   
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return CategoryRow(
        categoryName: landmarks[0].category.rawValue,
        items: Array(landmarks.prefix(3))
    )
}
