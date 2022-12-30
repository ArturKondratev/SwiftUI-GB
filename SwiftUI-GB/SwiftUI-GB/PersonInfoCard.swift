//
//  PersonInfoCard.swift
//  SwiftUI-GB
//
//  Created by Артур Кондратьев on 25.12.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            UserCardStack(name: "Mark", color: .black) {
                
            }
            UserCardStack(name: "Mike", icon: "star", color: .blue) {
                
            }
            UserCardStack(name: "Artur", icon: "moon", color: .yellow) {
                
            }
        }
    }
}

struct UserCardStack<Content: View>: View {
    let content: Content
    let name: String
    let icon: String
    let color: Color
    
    init(
        name: String = "name",
        icon: String = "person",
        color: Color = .yellow,
        @ViewBuilder content: ()-> Content) {
            self.name = name
            self.icon = icon
            self.color = color
            self.content = content()
        }
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .modifier(CircleShadow(shadowColor: color, shadowRadius: 5))
            Text(name)
                .modifier(TextFormated(textSize: 28))
            content
        }
        .frame(width: 250, alignment: .leading)
    }
}

struct TextFormated: ViewModifier {
    let textSize: CGFloat
    func body(content: Content) -> some View {
        content
            .font(.system(size: textSize, weight: .light, design: .serif))
    }
}

struct CircleShadow: ViewModifier {
    let shadowColor: Color
    let shadowRadius: CGFloat
    func body(content: Content) -> some View {
        content
            .background(Circle()
                            .fill(Color.white)
                            .shadow(color: shadowColor, radius: shadowRadius))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

