//
//  Models.swift
//  PlanMyTrip
//
//  Created by Milana Shakhbieva on 21.10.2024.
//

import Foundation

struct Destination: Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: URL?
}

struct Trip: Identifiable {
    let id = UUID()
    var name: String
    var dates: String
    var placesCount: Int
}

struct TripDetail {
    let trip: Trip
    var destination: Destination?
    var dates: String
    var placesCount: Int
}
