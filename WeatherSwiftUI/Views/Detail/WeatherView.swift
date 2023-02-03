//
//  WeatherView.swift
//  WeatherSwiftUI
//
//  Created by Владислав Калинин on 22.11.2022.
//

import SwiftUI

struct WeatherView: View {
    // MARK: - PROPERTIES
    
    @State var searchText = ""
    var searchResults: [Forecast] {
        if searchText.isEmpty {
            return Forecast.cities
        } else {
            return Forecast.cities.filter {$0.location.contains(searchText)}
        }
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            // MARK: Background Color
            Color.background
                .ignoresSafeArea()
            
            // MARK: Weather Widgets
            ScrollView(showsIndicators: false) {
                VStack (spacing: -160) {
                    ForEach(searchResults) { forecast in
                        WeatherWidget(forecast: forecast)
                    }
                }
            }
//            .safeAreaInset(edge: .top) {
//                EmptyView()
//                    .frame(height: 110)
//            }
        }
        .overlay {
            
            // MARK: Navigation Bar
            NavigationBar(searchText: $searchText)
        }
        .navigationBarHidden(true)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for a city or an airport")
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WeatherView()
                .preferredColorScheme(.dark)
        }
    }
}