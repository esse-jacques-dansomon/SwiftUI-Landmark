//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Esse Jacques  on 09/01/2024.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button{
            isSet.toggle()
        } label: {
            Label(
                "Toggle Favorite",
                systemImage: isSet ? "star.fill": "star")
            .labelStyle(.iconOnly)
            .foregroundColor(isSet ? .yellow : .black)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
