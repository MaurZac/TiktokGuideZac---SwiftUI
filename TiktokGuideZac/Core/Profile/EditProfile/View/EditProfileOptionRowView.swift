//
//  EditProfileOptionRowView.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 7/1/24.
//

import SwiftUI

struct EditProfileOptionRowView: View {
    let option: EditProfileOptions
    let value: String
    var body: some View {
        NavigationLink(value: option){
            HStack{
                Text(option.title)
                Spacer()
                Text(value)
            }
        }
        .foregroundStyle(.primary)
    }
}
#Preview {
    EditProfileOptionRowView(option: .username, value: "MaurZac ")
}
