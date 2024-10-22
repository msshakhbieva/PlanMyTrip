//
//  TripDetailViewModel.swift
//  PlanMyTrip
//
//  Created by Milana Shakhbieva on 21.10.2024.
//

import Foundation
import SwiftUI
import Combine

class TripsDetailViewModel: ObservableObject {
    @Published var tripDetail: TripDetail
    
    init(tripDetail: TripDetail) {
        self.tripDetail = tripDetail
    }
}
