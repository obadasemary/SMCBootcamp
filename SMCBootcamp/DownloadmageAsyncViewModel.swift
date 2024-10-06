//
//  DownloadmageAsyncViewModel.swift
//  SMCBootcamp
//
//  Created by Abdelrahman Mohamed on 06/10/2024.
//

import SwiftUI
import Combine

class DownloadmageAsyncViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    let loader = DownloadmageAsyncImageLoader()
    var cancellables = Set<AnyCancellable>()
    
    func fetchImage() {
        
        loader.downloadwithEscaping { [weak self] image, error in
            if let image = image {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
    
    func fetchImageWtihCombine() {
        loader.downloadWithCombine()
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] image in
                self?.image = image
            }
            .store(in: &cancellables)
    }
}
