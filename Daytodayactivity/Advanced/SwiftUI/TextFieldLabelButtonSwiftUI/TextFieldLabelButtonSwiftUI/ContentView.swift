//
//  ContentView.swift
//  TextFieldLabelButtonSwiftUI
//
//  Created by FCI on 05/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username:String=""
    @State private var password:String=""
    
    @State private var labelstring1:String=""
    @State private var labelstring2:String=""
    
    var body: some View {
        VStack {
            TextField("Enter UserName Here",text: $username)
                .padding()
                .border(Color.yellow,width: 5)
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(20.0)
            SecureField("Enter Password Here",text: $password)
                .padding()
                .border(Color.primary)
                .cornerRadius(10.0)
            
            Label(labelstring1,systemImage: "")
                .font(.caption)
                .padding()
                .frame(maxWidth:.infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10.0)
            
            Label(labelstring2,systemImage: "")
                .font(.caption)
                .padding()
                .frame(maxWidth:.infinity)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10.0)
            Button(action: {
                labelstring1=username
                labelstring2=password
            }){
                Text("Click")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(20)
                    .foregroundColor(.indigo)
                    .background(Color.yellow)
                    .cornerRadius(10.0)
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
