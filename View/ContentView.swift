//
//  ContentView.swift
//  PlanMyTrip
//
//  Created by Milana Shakhbieva on 21.10.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Главная")
                }
            
            Text("Карта")
                .tabItem {
                    Image(systemName: "map")
                    Text("Карта")
                }
            
            TripsView()
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Поездки")
                }
            
            Text("Профиль")
                .tabItem {
                    Image(systemName: "person")
                    Text("Профиль")
                }
        }
    }
}
