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
    
    func addAuthor() async {
        let author1 = "Author1 \(Thread.current)"
        self.dataArray.append(author1)
        
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        
        let author2 = "Author2 \(Thread.current)"
        await MainActor.run {
            self.dataArray.append(author2)
            
            let author3 = "Author3 \(Thread.current)"
            self.dataArray.append(author3)
        }
        
        await addSomething()
    }
    
    func addSomething() async {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        
        let something1 = "Something1 \(Thread.current)"
        await MainActor.run {
            self.dataArray.append(something1)
            
            let something2 = "Something2 \(Thread.current)"
            self.dataArray.append(something2)
        }
    }
}
