//
//  FeedView.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 6/20/24.
//

import SwiftUI
import AVKit

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    @State private var scrollPostion: String?
    @State private var player = AVPlayer()
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 0){
                ForEach(viewModel.post){ post in
                    FeedCell(post: post, player: player)
                        .id(post.id)
                   
                }
            }
            .scrollTargetLayout()
        }
        .onAppear{ player.play()}
        .scrollPosition(id: $scrollPostion)
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        .onChange(of: scrollPostion) { oldValue, newValue in
           playVideoOnchangeOfScrollPosition(postId: newValue)
        }
    }
    func playVideoOnchangeOfScrollPosition(postId: String?){
        guard let currentPost = viewModel.post.first(where: {$0.id == postId}) else {return}
        player.replaceCurrentItem(with: nil)
        let playerItem = AVPlayerItem(url: URL(string: currentPost.videoUrl)!)
        player.replaceCurrentItem(with: playerItem)
    }
}

#Preview {
    FeedView()
}
