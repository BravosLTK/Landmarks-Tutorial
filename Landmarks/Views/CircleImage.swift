//
//  CircleImage.swift
//  Landmarks
//
//  Created by Brandon Bravos on 7/1/23.
//

import SwiftUI

struct CircleImage: View {
    var image: Image

    var body: some View {
       image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.gray, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image:  Image("turtlerock"))
    }
}
