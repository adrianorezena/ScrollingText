//
//  ScrollingView.swift
//  ScrollingText
//
//  Created by Adriano Rezena on 11/03/23.
//

import SwiftUI

struct ScrollingView<Content: View>: View {
    let content: Content
    @State private var isScrolling: Bool = false
    let animationDuration: CGFloat = 5
    @State private var viewSize: CGFloat = 0
    
    init(@ViewBuilder content: () -> Content) {
         self.content = content()
     }
    
    var body: some View {
        GeometryReader { reader in
            content
                .overlay(
                    GeometryReader(content: { proxy in
                        VStack {}
                        .onAppear {
                            self.viewSize = proxy.size.width
                        }
                    })
                )
                .offset(x: isScrolling ? -viewSize : reader.size.width)
                .animation(.linear(duration: animationDuration).repeatForever(autoreverses: false), value: isScrolling)
        }
        .task { @MainActor in
            try? await Task.sleep(for: .seconds(1))
            isScrolling = true
        }
    }
}
