//
//  DownloadmageAsync.swift
//  SMCBootcamp
//
//  Created by Abdelrahman Mohamed on 06/10/2024.
//

import SwiftUI

struct DownloadmageAsync: View {
    @StateObject private var viewModel = DownloadmageAsyncViewModel()
    
    var body: some View {
        ZStack {
            if let image  = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .onTapGesture {
            viewModel.fetchImageWtihCombine()
        }
        .onAppear {
            viewModel.fetchImage()
        }
    }
}

#Preview {
    DownloadmageAsync()
}
