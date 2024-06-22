//
//  RegistrationView.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 6/21/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @State private var userName = ""
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: RegistrationViewModel
    
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
        self._viewModel = StateObject(wrappedValue: RegistrationViewModel(authService: authService))
    }
    
    
    var body: some View {
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
                    .textInputAutocapitalization(.never)
                    .modifier(StandardTextFieldModifier())
                
                TextField("Enter your full name", text: $fullName)
                    .textInputAutocapitalization(.never)
                    .modifier(StandardTextFieldModifier())
                
                TextField("Enter your user name", text: $userName)
                    .textInputAutocapitalization(.never)
                    .modifier(StandardTextFieldModifier())
                Button {
                    Task {
                        await viewModel.createUser(withEmail: email,
                                                   password: password,
                                                   userName: userName,
                                                   fullName: fullName)
                    }
                } label: {
                    Text("Sign Up")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 350, height: 44)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1 : 0.7)
                .padding(.vertical)
                
                Spacer()
                Divider()
                
                Button {
                    dismiss()
                } label: {
                    HStack{
                        Text("Already have an account?")
                        Text("Sign In")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .padding(.vertical)
                }

            }
        }
        .navigationBarBackButtonHidden()
        .padding(.vertical,80)
    }
}
extension RegistrationView: AuthenticationFormProtocol{
    var formIsValid: Bool{
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 4
        && !fullName.isEmpty
        && !userName.isEmpty
    }
}

#Preview {
    RegistrationView(authService: AuthService())
}
