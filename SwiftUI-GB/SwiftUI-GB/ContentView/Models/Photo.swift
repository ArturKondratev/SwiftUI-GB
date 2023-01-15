//
//  Photo.swift
//  SwiftUI-GB
//
//  Created by Артур Кондратьев on 15.01.2023.
//

import Foundation

class Photo: Identifiable {
    let id: UUID = UUID()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
