//
//  ContentView.swift
//  Diciee
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

                // EarthView in the center, large size
                EarthView()
                    .frame(width: 400, height: 400)
                    .padding(.bottom, 20)


                // "Roll" button (you can connect it to custom logic)
    

                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
