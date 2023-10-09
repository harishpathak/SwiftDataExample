//
//  ContentView.swift
//  MyTripGuide
//
//  Created by Harish on 09/10/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var destinations: [Destination]
    @State private var path = [Destination]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                List {
                    ForEach(destinations) { destination in
                        NavigationLink(value: destination) {
                            VStack(alignment: .leading) {
                                Text(destination.name)
                                    .font(.headline)
                                    .bold()
                                
                                Text(destination.date.formatted(date: .long, time: .shortened))
                                    .font(.subheadline)
                            }
                        }
                    }
                    .onDelete(perform: deleteDestinations)
                }
            }
            .navigationTitle("Destinations")
            .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
            .toolbar {
                Button(action: addDestination) {
                    Text("Add Destination")
                }
            }
        }
        
    }
    
    func addDestination() {
        let destination = Destination()
        modelContext.insert(destination)
        path = [destination]
    }
    
    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
}

#Preview {
    ContentView()
}
