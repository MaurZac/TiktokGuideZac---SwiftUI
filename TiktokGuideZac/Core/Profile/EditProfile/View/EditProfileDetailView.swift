//
//  EditProfileDetailView.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 7/1/24.
//

import SwiftUI

struct EditProfileDetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var value = ""
    let user: User
    let option: EditProfileOptions
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                TextField("Add your bio", text: $value)
                Spacer()
                if !value.isEmpty{
                    Button {
                        value = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
            Divider()
            Text(nagivationTitles)
                .font(.footnote)
                .foregroundStyle(.gray)
                .padding(.top, 8)
            
            Spacer()
            
           
        }
        .padding()
        .navigationTitle(option.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .onAppear{ onViewAppear()}
        .toolbar{
            ToolbarItem(placement: .topBarLeading){
                Button("Cancel") { dismiss() }
            }
            ToolbarItem(placement: .topBarTrailing){
                Button("Save") { dismiss() }
                    .fontWeight(.semibold)
            }
        }
    }
}

private extension EditProfileDetailView {
    var nagivationTitles: String {
        switch option {
        case .name:
           return  "Your full name can only be changed once every 7 days"
        case .bio:
            return "Tells us a little bit about yourself"
        case .username:
            return "Username can contain only letters, numbers, underscores, and periods."
        }
    }
    
    func onViewAppear(){
        switch option {
        case .name:
            value =  user.fullName
        case .bio:
            value = user.bio ?? "lifestyle"
        case .username:
            value = user.userName
        }
    }
}

#Preview {
    NavigationStack{
        EditProfileDetailView( user: DeveloperPreview.user, option: .username)
            .tint(.primary)
    }
}
    
