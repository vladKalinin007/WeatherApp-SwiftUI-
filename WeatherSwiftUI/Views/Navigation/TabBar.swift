//
//  TabBar.swift
//  WeatherSwiftUI
//
//  Created by Владислав Калинин on 20.11.2022.
//

import SwiftUI

struct TabBar: View {
    // MARK: - PROPERTIES
    
    var action: () -> Void
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            
            // Arc shape
             Arc()
                .fill(Color.tabBarBackground )
                .frame(height: 88)
                .overlay {
                    Arc()
                        .stroke(Color.tabBarBorder, lineWidth: 0.5)
                }
            
            // Tab Items
            HStack {
                // MARK: Expand button
                Button {
                    action()
                } label: {
                    Image(systemName: "mappin.and.ellipse")
                        .frame(width: 44, height: 44)
                }
                
                Spacer()
                
                // MARK: Navigation button
                NavigationLink {
                    WeatherView()
                } label: {
                    Image(systemName: "list.star")
                        .frame(width: 44, height: 44)
                }
            } 
            .font(.title2)
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 20, leading: 32, bottom: 24, trailing: 32))
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
}

    // MARK: - PREVIEW
struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(action: {})
//            .preferredColorScheme(.dark)
    }
}
