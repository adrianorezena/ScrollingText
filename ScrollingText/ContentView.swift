//
//  ContentView.swift
//  ScrollingText
//
//  Created by Adriano Rezena on 10/03/23.
//

import SwiftUI

struct ScrollingView<Content : View>: View {
    let content: Content
    @State private var isScrolling: Bool = false
    let animationDuration: CGFloat = 5
    
    init(@ViewBuilder content: () -> Content) {
         self.content = content()
     }
    
    var body: some View {
        GeometryReader { reader in
            content
                .background(.gray.opacity(0.2))
                .offset(x: isScrolling ? 0 : reader.size.width)
                .animation(.linear(duration: animationDuration), value: isScrolling)
        }
        .task { @MainActor in
            try? await Task.sleep(for: .seconds(1))
            isScrolling = true
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            ScrollingView {
                Text("Hello, world!")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
