//
//  AsyncAwaitBootcamp.swift
//  SMCBootcamp
//
//  Created by Abdelrahman Mohamed on 07/10/2024.
//

import SwiftUI

class AsyncAwaitBootcampViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    func addTitle1() {
        dataArray.append("Title1: \(Thread.current)")
    }
}

struct AsyncAwaitBootcamp: View {
    
    @StateObject private var viewModel = AsyncAwaitBootcampViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.dataArray, id: \.self) { data in
                Text(data)
            }
        }
        .onAppear {
            viewModel.addTitle1()
        }
    }
}

#Preview {
    AsyncAwaitBootcamp()
}
