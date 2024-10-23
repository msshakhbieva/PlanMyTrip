//
//  HomeView.swift
//  PlanMyTrip
//
//  Created by Milana Shakhbieva on 21.10.2024.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("PlanMyTrip")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Куда поедем?", text: $viewModel.searchText)
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
                                KFImage.url(destination.imageUrl)
                                    .setProcessor(DownsamplingImageProcessor(size: CGSize(width: 60, height: 60)))
                                    .cacheMemoryOnly()
                                    .fade(duration: 0.25)
                                    .onFailure { error in
                                        print("Failed to load image: \(error.localizedDescription)")
                                    }
                                    .placeholder {
                                        ProgressView()
                                            .frame(width: 60, height: 60)
                                            .background(Color.gray.opacity(0.15))
                                            .cornerRadius(8)
                                    }
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(8)
                                
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
        .onAppear {
            viewModel.onAppear()
        }
    }
}



#Preview {
    HomeView()
}
