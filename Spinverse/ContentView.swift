//
//  ContentView.swift
//  Spinverse
//
//  Created by mai khaled on 02/03/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Background image
            Image("galaxy")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Spacer()

                EarthView()
                    .frame(width: 400, height: 400)
                    .padding(.bottom, 20)
    

                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
