//
//  EditDestinationView.swift
//  MyTripGuide
//
//  Created by Harish on 09/10/23.
//

import SwiftUI
import SwiftData

struct EditDestinationView: View {
    @Bindable var destination: Destination
    @State private var addedPlace: String = ""
    var body: some View {
        Form {
            TextField("Name", text: $destination.name)
            TextField("Details", text: $destination.details, axis: .vertical)
            DatePicker("Date", selection: $destination.date)
            
            Section("Priority") {
                Picker("Priority", selection: $destination.priority) {
                    Text("Low").tag(1)
                    Text("Medium").tag(2)
                    Text("High").tag(3)
                }
                .pickerStyle(.segmented)
            }
            
            Section("Sights") {
                ForEach(destination.sights) { sight in
                    Text(sight.name)
                }
                
                HStack {
                    TextField("Add a new place to visit in \(destination.name)", text: $addedPlace)
                    Button("Add", action: addNewPlace)
                }
            }
        }
        .navigationTitle("Edit Destination")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func addNewPlace() {
        guard addedPlace.isEmpty == false else {
            return
        }
        
        withAnimation {
            let place = Place(name: addedPlace)
            destination.sights.append(place)
            addedPlace = ""
        }
    }
}

#Preview {
    do {
        let configurations = ModelConfiguration(isStoredInMemoryOnly: true)
        let modelContainer = try ModelContainer(for: Destination.self, configurations: configurations)
        let destination = Destination(name: "Fake Destination", details: "Fake destinations details to show the description would grow vertically when reaches more content length.", date: .now)
        return EditDestinationView(destination: destination)
            .modelContainer(modelContainer)
    } catch {
        fatalError("Error creating model context")
    }
}
