//
//  ModelData.swift
//  Landmarks
//
//  Created by Brandon Bravos on 7/1/23.
//

import Foundation
import Combine


final class ModelData: ObservableObject {
    /// @Published is a property wrapper in SwiftUI and is used in combination with classes conforming to the ObservableObject protocol, marking properties of those classes that should trigger a view refresh when they are changed.
   @Published var landmarks: [Landmark] = load("landmarkData.json")
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

