//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Esse Jacques  on 12/01/2024.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    var round  = 15
    var isFullWidth = false

    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(
                    width: isFullWidth ? .infinity : 150,
                    height: isFullWidth ? 350 : 150
                )
                
                .cornerRadius(CGFloat(round))
            Text(landmark.name)
                .foregroundStyle(.primary)
                .font(.caption)
        }
        .padding( isFullWidth ? .all : .leading, 15)
    }
}


#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}

