//
//  ContentView.swift
//  TextViewAppSwiftUI
//
//  Created by FCI on 05/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            /// A "Hello, World!" text view with certain stylings
            Text("Hello, World!")
                .font(.title)
                .fontWeight(.heavy)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.black)
                .cornerRadius(10.0)
                .padding()
                        
            /// A group of text views each demonstrating different font weights
            Group {
                Text("Ultralight")
                    .fontWeight(.ultraLight)
                Text("Thin")
                    .fontWeight(.thin)
                Text("Light")
                    .fontWeight(.light)
                Text("Regular")
                    .fontWeight(.regular)
                Text("Medium")
                    .fontWeight(.medium)
                Text("Semibold")
                    .fontWeight(.semibold)
                Text("Bold")
                    .fontWeight(.bold)
                Text("Heavy")
                    .fontWeight(.heavy)
                Text("Black")
                    .fontWeight(.black)
            }.font(.title)  // apply title font to all texts in the group
                    
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
