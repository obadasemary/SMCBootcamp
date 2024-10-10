//
//  AsyncAwaitBootcampViewModel.swift
//  SMCBootcamp
//
//  Created by Abdelrahman Mohamed on 10/10/2024.
//


import SwiftUI

class AsyncAwaitBootcampViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    func addTitleMainAsyncAfter() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.dataArray.append("Title main.asyncAfter: \(Thread.current)")
        }
    }
    
    func addTitleGlobalAsyncAfter() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) { [weak self] in
            let title  = "Title global.asyncAfter: \(Thread.current)"
            DispatchQueue.main.async {
                self?.dataArray.append(title)
                
                let titleMain  = "Title main.asyncAfter: \(Thread.current)"
                self?.dataArray.append(titleMain)
            }
        }
    }
}
