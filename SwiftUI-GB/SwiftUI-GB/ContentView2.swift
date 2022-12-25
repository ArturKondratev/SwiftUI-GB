//
//  ContentView2.swift
//  SwiftUI-GB
//
//  Created by Артур Кондратьев on 25.12.2022.
//

import SwiftUI
import Combine

struct ContentView2: View {
    @State private var shouldShowLogo: Bool = true
    @State private var login = ""
    @State private var password = ""
    
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in false }
    ).removeDuplicates()
    
    var logo: some View {
        ZStack {
            Circle()
                .fill(.yellow)
                .shadow(color: .yellow, radius: 20, x: 0, y: 0)
                .frame(width: 100, height: 100, alignment: .center)
            Text("VK")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue)
        }
    }
    
    var registrationBlockView: some View {
        VStack {
            SecureField("Login:", text: $login)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password:", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
    
    var loginButton: some View {
        Button(action: {
            print(login, " logged in")
        }) {
            Text("Log in")
                .padding()
                .frame(width: 250, height: 50, alignment: .center)
        }
    }
    
    var body: some View {
        ZStack {
            Image("1")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ScrollView {
                    VStack {
                        if shouldShowLogo {
                            logo
                        }
                        
                        Spacer(minLength: 60)
                        registrationBlockView.frame(maxWidth: 250)
                        Spacer(minLength: 30)
                        loginButton.disabled(login.isEmpty || password.isEmpty)
                    }
                }.onReceive(keyboardIsOnPublisher) { isKeyboardOn in
                    withAnimation(Animation.easeInOut(duration: 0.5)) {
                        self.shouldShowLogo = !isKeyboardOn
                    }
                }
            }
            
            Spacer()
        }.onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

