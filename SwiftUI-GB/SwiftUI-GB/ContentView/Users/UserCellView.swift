//
//  UserCellView.swift
//  SwiftUI-GB
//
//  Created by Артур Кондратьев on 15.01.2023.
//

import SwiftUI

struct UserCellView: View {
    let user: User
    
    var body: some View {
        HStack {
            Image(self.user.photo)
                .resizable()
                .avatarModifier()
            
            VStack(alignment: .leading) {
                Text("\(self.user.firstName) \(self.user.lastName)")
                    .font(.body)
            
                Text("\(self.user.status.rawValue)")
                    .font(.subheadline)
                    .statusColorModifire(status: self.user.status)
            }
        }
        .padding(.init(top: 6,
                       leading: 0,
                       bottom: 6,
                       trailing: 0))
    }
}

struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(id: 0, firstName: "MARK", lastName: "K", photo: "3", status: .onLine)
        UserCellView(user: user)
    }
}
