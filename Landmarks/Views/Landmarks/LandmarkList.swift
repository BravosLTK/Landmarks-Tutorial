import SwiftUI

struct LandmarkList: View {
    /**
     EnvironmentObject is a type of property wrapper that can be used to create references to data that needs to be shared or accessed by multiple views in your app. This data is often referred to as "shared state". You can think of EnvironmentObject as a tool that allows you to inject dependencies into your view hierarchy.

     The EnvironmentObject allows data to be accessed from anywhere in a SwiftUI view hierarchy. This is achieved by adding an object to the environment of one view, and then any child view (or the view itself) can gain access to that object through the @EnvironmentObject property wrapper.

     To use EnvironmentObject, you would declare a class that conforms to the ObservableObject protocol and has properties marked with @Published
     */
    @EnvironmentObject var modelData: ModelData

    /**
     @State is a property wrapper provided by SwiftUI used to manage local, mutable state within a View. It lets SwiftUI know that whenever the state value changes, it should re-render the associated View to reflect that change.

     @State properties are generally used for simple pieces of data that belong to a specific view and aren't shared elsewhere. If you need to share data between multiple views, you would typically use either @ObservedObject, @EnvironmentObject, or @StateObject.
     */
    @State private var showFavoritesOnly = false

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }

                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        LandmarkList()
            .environmentObject(modelData)
    }
}
