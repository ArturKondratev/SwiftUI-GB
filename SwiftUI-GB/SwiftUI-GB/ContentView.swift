//
//  ContentView.swift
//  SwiftUI-GB
//
//  Created by Артур Кондратьев on 24.12.2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var login = ""
    @State private var password = ""
    @State private var shouldShowLogo: Bool = true
    
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in false }
    )
        .removeDuplicates()
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("1")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            }
            
            ScrollView (showsIndicators: false)  {
                VStack {
                    if shouldShowLogo {
                        Text("Добро пожаловать")
                            .font(.system(size: 30, design: .serif) .bold())
                            .foregroundColor(.white)
                            .padding(.top, 30)
                    }
                    VStack{
                        Text("ВКонтакте")
                            .font(.system(size: 30) .bold())
                            .foregroundColor(.blue)
                            .padding(.top, 30)
                        HStack {
                            Text("Login:")
                                .foregroundColor(.white)
                            Spacer()
                            TextField("", text: $login)
                                .frame(maxWidth: 200)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        HStack {
                            Text("Password:")
                                .foregroundColor(.white)
                            Spacer()
                            SecureField("", text: $password)
                                .frame(maxWidth: 200)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        Button(action: { print("Hello") }) {
                            Text("Log in")
                        }
                        .buttonStyle(.bordered)
                        .disabled(login.isEmpty || password.isEmpty)
                        .padding(.top, 50)
                        
                        Spacer()
                        
                    } .frame(maxWidth: 300)
                        .padding(.top, 50)
                }
                .onReceive(keyboardIsOnPublisher) { isKeyboardOn in
                    withAnimation(Animation.easeInOut(duration: 0.5)) {
                        self.shouldShowLogo = !isKeyboardOn
                    }
                }
            }
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from:
                    nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
