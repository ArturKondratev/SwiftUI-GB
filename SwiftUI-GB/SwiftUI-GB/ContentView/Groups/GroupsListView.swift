//
//  GroupsListView.swift
//  SwiftUI-GB
//
//  Created by Артур Кондратьев on 15.01.2023.
//

import SwiftUI

struct GroupsListView: View {
    @State var groups: [Group] = []
    
    var body: some View {
        
        List(self.groups.sorted(by: { $0.name < $1.name})) { group in
            GroupCellView(group: group)
        }.onAppear{
            self.groups = MocDataService.getGroups()
        }
    }
}

struct GroupsListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsListView()
    }
}

