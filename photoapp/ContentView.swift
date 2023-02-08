//
//  ContentView.swift
//  photoapp
//
//  Created by yuta kodama on 2022/11/23.
//

import SwiftUI
import FirebaseAuth


struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    

    
    var body: some View {
        NavigationView{
            
        
        VStack(spacing: 30) {
            Text("Welcome!")
                .foregroundColor(.black)
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .offset(y:-50)

            
            TextField("Email", text: $email)
                .foregroundColor(.gray)
                .textFieldStyle(.plain)
                .placeholder(when: email.isEmpty) {
                  
                }
                .offset(x:25, y:15)
            
            Rectangle()
                .frame(width: 300, height: 1)
            
            SecureField("Password", text: $password)
                .foregroundColor(.gray)
                .textFieldStyle(.plain)
                .placeholder(when: email.isEmpty) {
                    
                }
                .offset(x:25, y:15)
            
            Rectangle()
                .frame(width: 300, height: 1)
            
            Button {
login()
            } label: {
                Text("Sign In")
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 270, height: 48)
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(.black)
                            
                    )
            }
            .offset(y:70)
        
            NavigationLink(destination: FirstscreenView()){
                Text("sign up")
            }
            .offset(x:100,y:230)
            
            Text("Dont have an account?")
                .foregroundColor(.black)
                .font(.system(size: 17, weight: .bold, design: .rounded))
                .offset(x:-35,y:180)
            
            
          
        }
        .frame(width: 350)
        .offset(y:-60)
        
        
    }
        .foregroundColor(.yellow)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
}
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in if error != nil {
            print(error!.localizedDescription)
          }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
 }

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
  }

