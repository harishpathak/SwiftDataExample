//
//  MyTripGuideApp.swift
//  MyTripGuide
//
//  Created by Harish on 09/10/23.
//

import SwiftUI
import SwiftData

@main
struct MyTripGuideApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Destination.self)
    }
}
