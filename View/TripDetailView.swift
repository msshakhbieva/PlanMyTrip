//
//  TripDetailView.swift
//  PlanMyTrip
//
//  Created by Milana Shakhbieva on 21.10.2024.
//

import SwiftUI

struct TripDetailView: View {
    @ObservedObject var viewModel: TripsDetailViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    // Здесь должна быть логика возврата назад
                }) {
                    Image(systemName: "chevron.backward")
                }
                
                Spacer()
                
                Button(action: {
                    // Здесь должна быть логика редактирования поездки
                }) {
                    Image(systemName: "pencil")
                }
            }
            
            AsyncImage(url: viewModel.tripDetail.destination?.imageUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(height: UIScreen.main.bounds.height * 0.25)
            
            Text(viewModel.tripDetail.trip.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Button("Рекомендации") {}
            
            List {
                HStack {
                    Image(systemName: "calendar")
                    VStack(alignment: .leading) {
                        Text("Даты поездки")
                        Text(viewModel.tripDetail.dates)
                            .foregroundColor(.secondary)
                    }
                }
                
                HStack {
                    Image(systemName: "map")
                    VStack(alignment: .leading) {
                        Text("Места")
                        Text("\(viewModel.tripDetail.placesCount)")
                            .foregroundColor(.secondary)
                    }
                }
                
                HStack {
                    Image(systemName: "map.fill")
                    VStack(alignment: .leading) {
                        Text("Карта")
                        Text("Посмотреть на карте")
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .padding()
    }
}


