//
//  UserGalleryView.swift
//  SwiftUI-GB
//
//  Created by Артур Кондратьев on 15.01.2023.
//

import SwiftUI
import ASCollectionView

struct UserGalleryView: View {
    
    let user: User
    
    var body: some View {
        ASCollectionView(data: self.user.photos) { photo, context in
            Image("\(photo.name)")
                .resizable()
                .edgesIgnoringSafeArea(.all)
        }
        .layout {
            .grid(
                layoutMode: .adaptive(withMinItemSize: 100),
                itemSpacing: 5,
                lineSpacing: 5,
                itemSize: .absolute(100))
        }
    }
}

struct UserGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        UserGalleryView(user: User(id: 0, firstName: "Alex", lastName: "Petrov"))
    }
}

