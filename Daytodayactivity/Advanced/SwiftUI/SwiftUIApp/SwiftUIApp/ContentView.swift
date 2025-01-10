//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by FCI on 04/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .foregroundColor(Color.red)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
