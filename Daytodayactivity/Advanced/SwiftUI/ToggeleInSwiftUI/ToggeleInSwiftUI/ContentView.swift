//
//  ContentView.swift
//  ToggeleInSwiftUI
//
//  Created by FCI on 05/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isDarkMode: Bool = false
    var body: some View {
        VStack {
            /// A VStack containing a label and the Toggle.
            VStack {
                /// A toggle bound to the isDarkMode property, which is toggled
                /// between true and false as the user interacts with it.
                Toggle(isOn: $isDarkMode) {
                    Text("Enable Dark Mode")
                        .font(.title2)
                }
                .padding()
                
                // Display of the current mode based on the toggle's state
                Text(isDarkMode ? "Dark Mode is ON" : "Dark Mode is OFF")
                    .font(.headline)
            }
            .padding()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
