//
//  TripsView.swift
//  PlanMyTrip
//
//  Created by Milana Shakhbieva on 21.10.2024.
//

import SwiftUI

struct TripsView: View {
    @StateObject private var viewModel = TripsViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Text("Мои поездки")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button(action: viewModel.addNewTrip) {
                        Image(systemName: "plus")
                    }
                }
                
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 16) {
                        ForEach(viewModel.trips) {trip in
                            HStack {
                                Image(systemName: "globe")
                                    .frame(width: 40, height: 40)
                                
                                VStack(alignment: .leading) {
                                    Text(trip.name)
                                        .font(.headline)
                                    Text(trip.dates)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .padding(.horizontal)
        }
    }
}
#Preview {
    TripsView()
}
