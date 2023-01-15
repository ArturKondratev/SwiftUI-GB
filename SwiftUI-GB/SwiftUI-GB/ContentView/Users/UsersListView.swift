//
//  UsersListView.swift
//  SwiftUI-GB
//
//  Created by Артур Кондратьев on 15.01.2023.
//

import SwiftUI

struct UsersListView: View {
    @State var users: [User] = []
    
    var body: some View {
        
        List(self.users) { user in
            NavigationLink(
                destination: UserGalleryView(user: user),
                label: {
                    UserCellView(user: user)
                })
        }.onAppear{
            self.users = MocDataService.getUsers()
        }
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}



