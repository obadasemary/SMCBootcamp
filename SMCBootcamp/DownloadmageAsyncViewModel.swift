//
//  DownloadmageAsyncViewModel.swift
//  SMCBootcamp
//
//  Created by Abdelrahman Mohamed on 06/10/2024.
//

import SwiftUI

class DownloadmageAsyncViewModel: ObservableObject {
    
    @Published var image: Image? = nil
    
    func fetchImage() {
        self.image = Image(systemName: "gear.fill")
    }
}
