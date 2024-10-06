//
//  DownloadmageAsyncImageLoader.swift
//  SMCBootcamp
//
//  Created by Abdelrahman Mohamed on 07/10/2024.
//

import SwiftUI
import Combine

class DownloadmageAsyncImageLoader {
    
    func prepareUrl() -> URL? {
        guard let url = URL(string: "https://picsum.photos/200/300") else {
            return nil
        }
        
        return url
    }
    
    func handleResponse(data: Data?, response: URLResponse?) -> UIImage? {
        guard
            let data = data,
            let image = UIImage(data: data),
            let response = response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300
        else {
            return nil
        }
        
        return image
    }
    
    func downloadwithEscaping(completionHandler: @escaping (_ image: UIImage?, _ error: Error?) -> ()) {
        guard let url = prepareUrl() else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            let image = self?.handleResponse(data: data, response: response)
            completionHandler(image, nil)
        }
        .resume()
    }
    
    func downloadWithCombine() -> AnyPublisher<UIImage?, Error> {
        guard let url = prepareUrl() else {
            return Fail(outputType: UIImage?.self, failure: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(handleResponse)
            .mapError({ $0 })
            .eraseToAnyPublisher()
    }
}
