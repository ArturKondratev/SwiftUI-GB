//
//  Group.swift
//  SwiftUI-GB
//
//  Created by Артур Кондратьев on 15.01.2023.
//

import Foundation

class Group: Identifiable {
    let id: Int
    let name: String
    let photo: String
    
    init(id: Int, name: String, photo: String = "") {
        self.id = id
        self.name = name
        self.photo = photo
    }
}

