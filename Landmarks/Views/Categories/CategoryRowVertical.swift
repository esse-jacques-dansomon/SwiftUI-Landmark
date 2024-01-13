//
//  CategoryRowRound.swift
//  Landmarks
//
//  Created by Esse Jacques  on 12/01/2024.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct CategoryRowVertical: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading){
            Text(categoryName).font(.headline)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center,spacing: 0){
                    ForEach(items) { landmark in
                        CategoryItem(landmark: landmark,isFullWidth: true)
                    }
                }
            }
        }
   
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return CategoryRowVertical(
        categoryName: landmarks[0].category.rawValue,
        items: Array(landmarks.prefix(3))
    )
}
