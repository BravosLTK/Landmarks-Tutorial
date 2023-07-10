//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Brandon Bravos on 7/1/23.
//
import SwiftUI


struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData

    var landmark: Landmark

    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }

    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)


            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)


            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    /**
                     In SwiftUI, the $ sign is used in front of a variable name to create a binding to a mutable state. This can be used with SwiftUI's property wrappers like @State, @Binding, @StateObject, and @ObservedObject.

                     When you put $ before a property, you're not accessing the property's value; instead, you're accessing a Binding to that property. A Binding provides a reference-like access to a value type (like a struct) which would normally be passed as value (copied) in Swift.

                     Bindings are used to create a two-way connection between a place that stores data and a user interface element (like a TextField or Toggle). This way, when the user interacts with the user interface element, the underlying data changes, and when the underlying data changes, the user interface element updates to reflect that change.
                     */
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }


                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)


                Divider()


                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
            .environmentObject(modelData)
    }
}
