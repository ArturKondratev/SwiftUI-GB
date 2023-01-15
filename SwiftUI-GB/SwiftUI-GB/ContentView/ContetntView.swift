//
//  ContetntView.swift
//  SwiftUI-GB
//
//  Created by Артур Кондратьев on 15.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var isLoginComplete = false
    
    var body: some View {
        NavigationView {
            HStack {
                
                LoginView(isLoginComplete: $isLoginComplete)
                
                NavigationLink(
                    destination: MainView(),
                    isActive: self.$isLoginComplete,
                    label: {
                        EmptyView()
                    })
                    
            }
            .navigationBarHidden(true)
        }
    }
}
