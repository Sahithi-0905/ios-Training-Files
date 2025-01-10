//
//  ContentView.swift
//  WebservicesInSwiftUI
//
//  Created by Naga Murali Akula on 01/08/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var posts = [Posts]()
    
    
    var body: some View {
       
        VStack {
                    List(posts){ post in
                        VStack(alignment: .leading) {
                            Text("\(post.title)")
                                .font(.title)
                                .foregroundColor(.gray)
                                .padding(.bottom)
                            
                            
                                Text("\(post.body)")
                                    .font(.body)
                                    .fontWeight(.bold)
                            
                            
                        }
                    }
                    .onAppear(){
                        NetworkCall().loadPostData { posts in
                            self.posts = posts
                        }
                    }
                }
                
    }
}

#Preview {
    ContentView()
}
