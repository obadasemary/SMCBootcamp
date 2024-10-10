//
//  AsyncAwaitBootcamp.swift
//  SMCBootcamp
//
//  Created by Abdelrahman Mohamed on 07/10/2024.
//

import SwiftUI

struct AsyncAwaitBootcamp: View {
    
    @StateObject private var viewModel = AsyncAwaitBootcampViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.dataArray, id: \.self) { data in
                Text(data)
            }
        }
        .onAppear {
            viewModel.addTitleMainAsyncAfter()
            viewModel.addTitleGlobalAsyncAfter()
        }
    }
}

#Preview {
    AsyncAwaitBootcamp()
}
