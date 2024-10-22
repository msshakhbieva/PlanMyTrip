//
//  HomeView.swift
//  PlanMyTrip
//
//  Created by Milana Shakhbieva on 21.10.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("PlanMyTrip")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Куда поедем?", text: $searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                }
                .frame(maxWidth: .infinity)
                .padding(10)
                .background(Color.gray.opacity(0.15))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .padding(.bottom)
                
                Text("Рекомендуем посетить")
                    .font(.headline)
                    .padding(.bottom, -5)
                
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 16) {
                        ForEach(viewModel.destinations) { destination in
                            HStack(alignment: .center) {
                                AsyncImage(url: destination.imageUrl) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 60, height: 60)
                                        .cornerRadius(8)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 60, height: 60)
                                        .background(Color.gray.opacity(0.15))
                                        .cornerRadius(8)
                                }
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(destination.name)
                                        .font(.headline)
                                        .lineLimit(1)
                                    
                                    Text(destination.description)
                                        .foregroundColor(.secondary)
                                        .lineLimit(2)
                                }
                            }
                        }
                    }
                }
                .padding(.top)
            }
            .padding()
        }
    }
}



#Preview {
    HomeView()
}
