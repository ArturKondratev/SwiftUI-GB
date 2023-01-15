//
//  MocDataService.swift
//  SwiftUI-GB
//
//  Created by Артур Кондратьев on 15.01.2023.
//

import Foundation

class MocDataService {
    
    static func getUsers() -> [User] {
        var usersLockal: [User] = []
        
        for i in 0...10 {
            var photos: [Photo] = []
            for _ in 0...10 {
                photos.append(Photo(name: "1"))
            }
            let user = User(id: i,
                            firstName: "Иванов (\(i))",
                            lastName: "Иван", photo: "2",
                            status: .onLine,
                            photos: photos)
            usersLockal.append(user)
        }
        return usersLockal
    }
    
    static func getGroups() -> [Group] {
        return [Group(id: 1, name: "IOS Developer", photo: "g1"),
                Group(id: 2, name: "Swift Book", photo: "g2"),
                Group(id: 3, name: "Geek Brains", photo: "g3"),
                Group(id: 4, name: "Coral Travel", photo: "g4"),
                Group(id: 5, name: "MARVEL/DC", photo: "g5"),
                Group(id: 6, name: "NETFLIX", photo: "g6"),
                Group(id: 7, name: "Geek Brains", photo: "g3"),
                Group(id: 8, name: "Coral Travel", photo: "g4"),
                Group(id: 9, name: "MARVEL/DC", photo: "g5"),
                Group(id: 10, name: "Coral Travel", photo: "g4"),
                Group(id: 11, name: "MARVEL/DC", photo: "g5"),
                Group(id: 12, name: "NETFLIX", photo: "g6"),
                Group(id: 13, name: "Geek Brains", photo: "g3"),
        ]
    }
}
