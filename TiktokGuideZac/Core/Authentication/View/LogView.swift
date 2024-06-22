//
//  LogView.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 6/21/24.
//

import SwiftUI

struct LogView: View {
    @State private var email = ""
    @State private var password = ""
    @StateObject var viewModel: LoginViewModel
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
        self._viewModel = StateObject(wrappedValue: LoginViewModel(authService: authService))
    }
    
    var body: some View {
       
        NavigationStack{
            VStack{
                Spacer()
                //logo image
                Image("logo3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120,height: 120)
                    .padding()
                //textfield
                VStack{
                    TextField("Enter your email", text: $email)
                        .textInputAutocapitalization(.never)
                        .modifier(StandardTextFieldModifier())
                    
                    
                    SecureField("Enter your password", text: $password)
                        .modifier(StandardTextFieldModifier())
                }
                //login button
                NavigationLink{
                    Text("Forgot password?")
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing,28)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button {
                    Task{ await viewModel.login(withEmail: email, password: password) } 
                    print("DEBUG:Login")
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 350, height: 44)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(.vertical)
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1 : 0.7)

                Spacer()
                Divider()
                //go to sign up
                NavigationLink{
                    RegistrationView(authService: authService)
                }label: {
                    HStack(spacing:3){
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                    
                }
                .font(.footnote)
                .padding(.vertical, 10)
                
            }
        }
    }
}

//MARK: - AuthenticationProtocol

extension LogView: AuthenticationFormProtocol{
    var formIsValid: Bool{
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 4
    }
}

#Preview {
    LogView(authService: AuthService())
}
