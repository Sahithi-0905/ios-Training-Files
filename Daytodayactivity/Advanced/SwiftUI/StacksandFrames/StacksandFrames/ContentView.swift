//
//  ContentView.swift
//  StacksandFrames
//
//  Created by FCI on 04/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "goforward.10")
                .imageScale(.large)
                .foregroundStyle(.black)
            Image(systemName: "goforward.10")
                .imageScale(.large)
                .foregroundStyle(.red)
            Text("Hello, world!")
        }
        .padding()
        
        HStack { 
            Image(systemName: "goforward.10")
                .imageScale(.large)
                .foregroundStyle(.black)
            Image(systemName: "goforward.10")
                .imageScale(.large)
                .foregroundStyle(.red)
        }
    }
}

#Preview {
    ContentView()
}
