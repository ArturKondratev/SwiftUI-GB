//
//  GroupCellView.swift
//  SwiftUI-GB
//
//  Created by Артур Кондратьев on 15.01.2023.
//

import SwiftUI

struct GroupCellView: View {
    let group: Group
    
    var body: some View {
        HStack {
            Image(self.group.photo)
                .resizable()
                .avatarModifier()
            Text("\(self.group.name)")
                .font(.body)
        }
        .padding(.init(top: 6,
                       leading: 0,
                       bottom: 6,
                       trailing: 0))        
    }
}

struct GroupCellView_Previews: PreviewProvider {
    static var previews: some View {
        let group = Group(id: 0, name: "SWIFT", photo: "2")
        GroupCellView(group: group)
    }
}

