//
//  TripsViewModel.swift
//  PlanMyTrip
//
//  Created by Milana Shakhbieva on 21.10.2024.
//

import Foundation
import SwiftUI
import Combine

class TripsViewModel: ObservableObject {
    @Published var trips: [Trip] = []
    private var cancellables = Set<AnyCancellable>()
    
    func addNewTrip() {
        // Здесь должна быть логика добавления новой поездки
        let newTrip = Trip(name: "Новая поездка", dates: "01.01.2025 - 31.12.2025", placesCount: 0)
        trips.append(newTrip)
    }
}
