//
//  FirstscreenView.swift
//  photoapp
//
//  Created by yuta kodama on 2023/01/11.
//

import SwiftUI
import FirebaseAuth


struct FirstscreenView: View {
    @State private var email = ""
    @State private var password = ""
    
    
    
    var body: some View {
        NavigationView{
            
            
            VStack(spacing: 30) {
                Text("Create!")
                    .foregroundColor(.black)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(y:-50)

                TextField("Email", text: $email)
                    .foregroundColor(.gray)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        
                    }
                    .offset(x:25)
                
                Rectangle()
                    .frame(width: 300, height: 1)
                
                SecureField("Password", text: $password)
                    .foregroundColor(.gray)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        
                    }
                    .offset(x:25)
                
                Rectangle()
                    .frame(width: 300, height: 1)
                
                Button {
                register()
                    
                } label: {
                    Text("Sign Up")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 270, height: 48)
                        .background(
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .fill(.black)
                            
                        )
                }
                .offset(y:75)
                
                
                NavigationLink(destination: ContentView()){
                    Text("Sign In")
                }
                .offset(x:111,y:230)

                
                Text("Already have an account?")
                    .foregroundColor(.black)
                    .font(.system(size: 17, weight: .bold, design: .rounded))
                    .offset(x:-45,y:180)
                
                
                
                }
            .frame(width: 350)
            .offset(y:-60)
            
            
        }
        .foregroundColor(.yellow)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in if error != nil {
            print(error!.localizedDescription)
          }
        }
    }

}

struct FirstscreenView_Previews: PreviewProvider {
    static var previews: some View {
        FirstscreenView()
        
        
    }
}


extension View {
    func Placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
