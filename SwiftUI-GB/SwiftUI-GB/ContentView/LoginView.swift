//
//  LoginView.swift
//  SwiftUI-GB
//
//  Created by Артур Кондратьев on 25.12.2022.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    @State private var showIncorrentCredentialsWarning = false
    @State private var shouldShowLogo: Bool = true
    @State private var login = "Admin"
    @State private var password = "Admin"
    
    @Binding var isLoginComplete: Bool
    
    private func verifyLoginData() {
        if login == "Admin" && password == "Admin" {
            isLoginComplete = true
        } else {
            showIncorrentCredentialsWarning = true
        }
        password = ""
    }
    
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
            TextField("Login:", text: $login)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password:", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
    
    var loginButton: some View {
        Button(action: verifyLoginData)
        {
            Text("Log in")
                .padding()
                .frame(width: 250, height: 50, alignment: .center)
        }
    }
    
    var body: some View {
        NavigationView {
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
                
            }.alert(isPresented: $showIncorrentCredentialsWarning, content: {
                Alert(title: Text("Error"), message: Text("Incorrent Login/Password wasentered"))
            })
        }
    }
    
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in false }
    ).removeDuplicates()
    
}

struct WeatherView: View {
    var body: some View {
        Image("star")
            .frame(width: 10, height: 200)
            .debug()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension View {
    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}
