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
                    
                    Text("Need a ride?")
                        .foregroundColor(.white)
                        .padding()
                }
            }
            
            ScrollingView {
                Text("Hello, world!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

