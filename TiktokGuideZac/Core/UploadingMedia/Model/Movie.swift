//
//  Movie.swift
//  TiktokGuideZac
//
//  Created by Mauricio Zarate Chula on 7/7/24.
//

import Foundation
import PhotosUI
import SwiftUI

struct Movie: Transferable {
    let url: URL
    static var transferRepresentation: some TransferRepresentation {
        FileRepresentation(contentType: .movie) { movie in
            SentTransferredFile(movie.url)
        } importing: { received in
            let copy = URL.documentsDirectory.appending(path: "movie.mp4")
            if FileManager.default.fileExists(atPath: copy.path()){
                try FileManager.default.removeItem(at: copy)
            }
            try FileManager.default.copyItem(at: received.file, to: copy)
            return Movie(url: copy)
        }
    }
}
