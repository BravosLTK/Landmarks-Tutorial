//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Brandon Bravos on 7/10/23.
//

import SwiftUI

struct FavoriteButton: View {
    /**
     @Binding is a property wrapper in SwiftUI that creates a two-way connection between a view that owns some state and a view that just needs to read or mutate that state.

     This can be helpful in situations where you have a piece of state in a parent view, but you want a child view to be able to modify that state. By using @Binding, the child view gets a reference to the parent view's state, and it can read and write that state as if it were its own. But in reality, the state is still owned by the parent view.

     Because you use a binding, changes made inside this view propagate back to the data source.
     */
    @Binding var isSet: Bool

    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
