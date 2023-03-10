//
//  ContentView.swift
//  ScrollingText
//
//  Created by Adriano Rezena on 10/03/23.
//

import SwiftUI

struct ScrollingText: View {
    @State private var isScrolling: Bool = false
    var textView: Text
    let animationDuration: CGFloat = 5
    
    var body: some View {
        GeometryReader { reader in
            textView
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
            ScrollingText(
                textView: Text("Hello, world!")
            )
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
