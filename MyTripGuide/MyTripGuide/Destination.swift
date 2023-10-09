//
//  Destination.swift
//  MyTripGuide
//
//  Created by Harish on 09/10/23.
//

import Foundation
import SwiftData

@Model
class Destination {
    var name: String
    var details: String
    var date: Date
    var priority: Int
    @Relationship(deleteRule: .cascade) var sights = [Place]()
    
    init(name: String = "", details: String = "", date: Date = .now, priority: Int = 1) {
        self.name = name
        self.details = details
        self.date = date
        self.priority = priority
    }
}
