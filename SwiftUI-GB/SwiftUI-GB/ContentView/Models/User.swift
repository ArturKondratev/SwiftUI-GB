//
//  User.swift
//  SwiftUI-GB
//
//  Created by Артур Кондратьев on 15.01.2023.
//

import Foundation

class User: Identifiable {
    var id: Int
    let firstName: String
    let lastName: String
    var status: Status
    let photo: String
    let photos: [Photo]
    
    init(id: Int, firstName: String, lastName: String, photo: String = "", status: Status = .offLine, photos: [Photo] = []) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.status = status
        self.photo = photo
        self.photos = photos
    }
}

