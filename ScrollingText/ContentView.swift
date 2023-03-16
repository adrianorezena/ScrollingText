//
//  ContentView.swift
//  ScrollingText
//
//  Created by Adriano Rezena on 10/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ScrollingView {
                Text("Hello, world! This is a very big text that will scroll on screen")
                    .fixedSize()
            }
            .frame(height: 50)
        
            ScrollingView {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .overlay {
                            Image("img_ride")
                                .resizable()
                                .scaledToFill()
                        }
                        .clipped()
                        .frame(height: 100)
                        .frame(maxWidth: .infinity)
                    
                    VStack(alignment: .leading) {
                        Text("You can scroll whatever you want.")
                        Text("Even a picture.")
                            .fontWeight(.bold)
                    }
                    .padding(.leading)
                }
                .foregroundColor(.white)
            }
            .frame(height: 100)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

