//
//  UploadPostView.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 7/5/24.
//

import SwiftUI

struct UploadPostView: View {
    @State private var caption = ""
    var body: some View {
        VStack{
            HStack(alignment: .top){
                TextField("Enter your caption", text: $caption, axis: .vertical)
                Spacer()
                
                Image(.logo)
                    .resizable()
                    .frame(width: 88,height: 100)
                    .clipShape(.rect(cornerRadius: 10))
            }
            Divider()
            Spacer()
            Button {
                
            } label: {
                Text("Post")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 352, height: 44)
                    .background(Color(.systemPink))
                    .cornerRadius(8)
                    
            }

        }
        .padding()
    }
}

#Preview {
    UploadPostView()
}
