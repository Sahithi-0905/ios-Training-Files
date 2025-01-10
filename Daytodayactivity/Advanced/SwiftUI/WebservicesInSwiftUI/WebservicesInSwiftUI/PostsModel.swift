//
//  PostsModel.swift
//  WebservicesInSwiftUI
//
//  Created by Naga Murali Akula on 01/08/24.
//

import Foundation

struct Posts: Codable, Identifiable {
    var id: Int
    var userId: Int
    var title: String
    var body: String
}
