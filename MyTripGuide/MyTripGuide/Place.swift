//
//  Place.swift
//  MyTripGuide
//
//  Created by Harish on 09/10/23.
//

import Foundation
import SwiftData

@Model
class Place {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
